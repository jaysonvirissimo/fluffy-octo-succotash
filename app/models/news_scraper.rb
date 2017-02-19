# frozen_string_literal: true
class NewsScraper
  BUSINESS_TITLE = 'Business this week'
  POLITICS_TITLE = 'Politics this week'
  ROOT_URL = 'http://www.economist.com'
  START_URL = 'http://www.economist.com/printedition'

  attr_reader :root_page

  def initialize
    @root_page = Nokogiri::HTML(HTTParty.get(START_URL))
  end

  def business_news_item_elements
    Nokogiri::HTML(HTTParty.get(business_url)).css('p').map(&:text)
  end

  def date
    @date ||= Date.parse(root_page.css('.print-edition__date').text.strip)
  end

  def politics_news_item_elements
    Nokogiri::HTML(HTTParty.get(politics_url)).css('p').map(&:text)
  end

  private

  def business_url
    ROOT_URL + root_page.css('.list a').find do |element|
      element.text == BUSINESS_TITLE
    end['href']
  end

  def politics_url
    ROOT_URL + root_page.css('.list a').find do |element|
      element.text == POLITICS_TITLE
    end['href']
  end
end
