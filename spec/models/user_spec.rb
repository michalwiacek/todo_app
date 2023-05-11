# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  it { is_expected.to have_many(:todo_lists).dependent(:delete_all) }
end
