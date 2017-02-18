# frozen_string_literal: true
class NewsItem < ApplicationRecord
  CATEGORIES = %w(business politics).freeze

  belongs_to :news_week

  validates :body, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
