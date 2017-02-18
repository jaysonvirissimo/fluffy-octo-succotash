# frozen_string_literal: true
require 'rails_helper'

RSpec.describe NewsItem, type: :model do
  let(:instance) { NewsItem.new(attributes) }
  let(:news_week) { NewsWeek.create!(date: Date.current) }
  let(:valid_attributes) do
    { body: 'In todays news...', news_week: news_week, category: 'business' }
  end

  context 'with valid attributes' do
    let(:attributes) { valid_attributes }

    specify { expect(instance).to be_valid }
  end

  context 'without an associated news week' do
    let(:attributes) { valid_attributes.merge(news_week: nil) }

    specify { expect(instance).to_not be_valid }
  end

  context 'with an unknown category' do
    let(:attributes) { valid_attributes.merge(category: 'WAT') }

    specify { expect(instance).to_not be_valid }
  end

  context 'without a body' do
    let(:attributes) { valid_attributes.merge(body: nil) }

    specify { expect(instance).to_not be_valid }
  end
end
