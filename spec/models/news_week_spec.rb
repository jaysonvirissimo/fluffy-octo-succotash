# frozen_string_literal: true
require 'rails_helper'

RSpec.describe NewsWeek, type: :model do
  let(:news_week) { Fabricate(:news_week) }

  specify { expect(NewsWeek.new).to be_invalid }
  specify { expect(news_week).to be_valid }

  context 'with associated news item' do
    let!(:news_item) { Fabricate(:news_item, news_week: news_week) }

    specify { expect(news_week.news_items).to include(news_item) }
  end
end
