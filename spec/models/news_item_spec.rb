# frozen_string_literal: true
require 'rails_helper'

RSpec.describe NewsItem, type: :model do
  let(:news_item) { Fabricate(:news_item) }
  let(:with_null_body) { Fabricate.build(:news_item, body: nil) }
  let(:with_blank_body) { Fabricate.build(:news_item, body: '') }
  let(:without_news_week) { Fabricate.build(:news_item, news_week: nil) }
  let(:with_fake_category) { Fabricate.build(:news_item, category: 'fake') }

  specify { expect(news_item).to be_valid }
  specify { expect(NewsItem.new).to_not be_valid }
  specify { expect(with_null_body).to_not be_valid }
  specify { expect(with_blank_body).to_not be_valid }
  specify { expect(without_news_week).to_not be_valid }
  specify { expect(with_fake_category).to_not be_valid }
end
