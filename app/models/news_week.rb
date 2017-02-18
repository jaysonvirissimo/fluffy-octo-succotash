# frozen_string_literal: true
class NewsWeek < ApplicationRecord
  has_many :news_items

  validates :date, presence: true
end
