require 'rails_helper'

RSpec.describe "NewsWeeks", type: :request do
  describe "GET /news_weeks" do
    it "works! (now write some real specs)" do
      get news_weeks_path
      expect(response).to be_success
    end
  end
end
