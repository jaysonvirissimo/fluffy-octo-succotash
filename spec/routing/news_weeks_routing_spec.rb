require "rails_helper"

RSpec.describe NewsWeeksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/news_weeks").to route_to("news_weeks#index")
    end

    it "routes to #show" do
      expect(:get => "/news_weeks/1").to route_to("news_weeks#show", :id => "1")
    end
  end
end
