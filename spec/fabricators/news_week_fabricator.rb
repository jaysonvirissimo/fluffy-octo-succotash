# frozen_string_literal: true
Fabricator(:news_week) do
  date { Date.current - 2.days }
end
