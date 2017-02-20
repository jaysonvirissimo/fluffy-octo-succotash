# frozen_string_literal: true
class NewsWeekBuilder
  attr_reader :current_date, :news_scraper

  def initialize(current_date: Current.date, news_scraper: NewsScraper.new)
    @current_date = current_date
    @news_scraper = news_scraper
  end

  def build
    return false unless time_to_rebuild?
    add_business_news_items
    add_political_news_items
    news_week
  end

  private

  def add_business_news_items
    news_scraper.business_items.each do |item|
      news_week.news_items.create!(body: item, category: 'business')
    end
  end

  def add_political_news_items
    news_scraper.political_items.each do |item|
      news_week.news_items.create!(body: item, category: 'politics')
    end
  end

  def last_news_week
    NewsWeek.last
  end

  def news_week
    @news_week ||= NewsWeek.create(date: news_scraper.date)
  end

  def time_to_rebuild?
    return true if NewsWeek.count.zero?
    return false if (current_date - last_news_week.date).days < 7.days
    last_news_week.date < news_scraper.date
  end
end
