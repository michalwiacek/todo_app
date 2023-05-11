# frozen_string_literal: true

require "rails_helper"

RSpec.describe TodoList do
  it { is_expected.to have_many(:items).dependent(:delete_all) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to belong_to(:user).required }
end
