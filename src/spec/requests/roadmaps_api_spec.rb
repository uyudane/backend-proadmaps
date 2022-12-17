require 'rails_helper'

RSpec.describe "RoadmapsApi", type: :request do
  before do
    authorization_moc
  end

  describe "GET /api/v1/roadmaps" do
    let(:roadmap_num) { 5 }
    before do
      FactoryBot.create_list(:roadmap, roadmap_num)
    end
    it "indexの結果" do
      get api_v1_roadmaps_path
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json.count).to eq(roadmap_num)
    end
  end
end
