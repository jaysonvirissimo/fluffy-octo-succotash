# frozen_string_literal: true
require 'rails_helper'

RSpec.describe NewsWeek, type: :model do
  let(:news_week) { NewsWeek.new(date: Date.current) }

  specify { expect(NewsWeek.new).to be_invalid }
  specify { expect(news_week).to be_valid }

  context 'with associated news item' do
    let!(:news_item) do
      NewsItem.create!(
        body: 'stuff',
        category: 'politics',
        news_week: news_week
      )
    end

    specify { expect(news_week.news_items).to include(news_item) }
  end
end
