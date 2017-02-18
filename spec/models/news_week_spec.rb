# frozen_string_literal: true
require 'rails_helper'

RSpec.describe NewsWeek, type: :model do
  specify { expect(NewsWeek.new).to be_invalid }
  specify { expect(NewsWeek.new(date: Date.current)).to be_valid }
end
