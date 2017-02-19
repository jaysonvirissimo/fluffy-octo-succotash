# frozen_string_literal: true
Fabricator(:news_item) do
  news_week
  body 'In other news...'
  category 'business'
end
