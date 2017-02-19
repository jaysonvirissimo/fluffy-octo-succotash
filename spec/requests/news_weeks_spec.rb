# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'NewsWeeks', type: :request do
  describe 'GET /news_weeks' do
    before { get news_weeks_path }

    specify { expect(response).to be_success }
    specify { expect(response.content_type).to eq(Mime[:json]) }
  end
end
