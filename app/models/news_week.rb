# frozen_string_literal: true
class NewsWeek < ApplicationRecord
  validates :date, presence: true
end
