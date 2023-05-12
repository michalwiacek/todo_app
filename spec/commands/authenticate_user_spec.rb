# frozen_string_literal: true

require "rails_helper"

RSpec.describe AuthenticateUser do
  subject(:context) { described_class.call(email, password) }

  describe ".call" do
    before { create(:user, email: "correct@email.com", password: "correct_password") }

    context "when the context is successful" do
      let(:email) { "correct@email.com" }
      let(:password) { "correct_password" }

      it "succeeds" do
        expect(context).to be_success
      end
    end

    context "when the context is not successful" do
      let(:email) { "wrong_user" }
      let(:password) { "wrong_password" }

      it "fails" do
        expect(context).to be_failure
      end
    end
  end
end
