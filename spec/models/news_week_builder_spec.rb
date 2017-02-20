# frozen_string_literal: true
require 'rails_helper'

RSpec.describe NewsWeekBuilder do
  let(:current_date) { Date.parse('Sun, 19 Feb 1914') }
  let(:built_instance) { instance.build }
  let(:business_items) do
    ['Ford Motor Company announces an eight-hour workday and $5 daily wage...']
  end
  let(:instance) do
    NewsWeekBuilder.new(current_date: current_date, news_scraper: mock_scraper)
  end
  let(:latest_items) { NewsWeek.last.news_items }
  let(:mock_scraper) do
    double(
      business_items: business_items,
      date: current_date - 1.day,
      political_items: political_items
    )
  end
  let(:political_items) do
    ['Franz Ferdinand was killed today in Sarajevo...']
  end

  context 'without any previous news weeks' do
    specify { expect(built_instance).to be_truthy }
    specify { expect(built_instance.news_items.length).to_not be_zero }
  end

  context 'less than a week after the previous news week' do
    let(:date) { current_date - 2.days }
    let!(:news_week) { Fabricate(:news_week, date: date) }

    specify { expect(built_instance).to be_falsey }
  end

  context 'a week or more after the previous news week' do
    let(:date) { current_date - 8.day }
    let!(:news_week) { Fabricate(:news_week, date: date) }

    specify { expect(built_instance).to be_truthy }
    specify { expect(built_instance.news_items.length).to_not be_zero }
  end
end
