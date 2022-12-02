# frozen_string_literal: true

task(:default).clear
task default: %i[rubocop spec]
