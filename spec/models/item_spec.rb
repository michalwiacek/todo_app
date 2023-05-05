# frozen_string_literal: true

require "rails_helper"

RSpec.describe Item do
  it { is_expected.to belong_to(:todo_list).required }
end
