require 'rails_helper'

RSpec.describe "LikesApi", type: :request do
  # let!(:current_user) { FactoryBot.create(:user) }

  # before do
  #   authorization_moc
  #   puts "before#{current_user.inspect}"
  #   controller = Api::V1::LikesController.new
  #   puts "controller#{controller.inspect}"
  #   controller.instance_variable_set(:@current_user, current_user)
  # end

  # describe "GET /api/v1/likes" do
  #   it "post like機能" do
  #     puts "it#{current_user.inspect}"
  #     roadmap = FactoryBot.create(:roadmap, user: current_user)
  #     post api_v1_likes_path, params: {
  #       roadmapId: roadmap.id,
  #       token: "dummy",
  #     }
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
