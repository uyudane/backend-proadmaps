require 'rails_helper'

RSpec.describe "RoadmapsApi", type: :request do
  describe "GET /roadmaps_apis" do
    it "works! (now write some real specs)" do
      get api_v1_roadmaps_path
      # p response
      expect(response).to have_http_status(210)
    end
  end
end
