require 'rails_helper'

RSpec.describe "UsersApi", type: :request do
  let!(:current_user) { FactoryBot.create(:user) }

  before do
    authorization_moc
  end

  # @current_userを表示するに至っていない
  describe "GET //api/v1/users/whoami" do
    it "whoamiの結果" do
      get api_v1_users_whoami_path
      # json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1/users" do
    let(:user_num) { 5 }
    before do
      FactoryBot.create(:user, name: "FirstUser")
      FactoryBot.create_list(:user, user_num)
    end
    it "indexの結果" do
      get api_v1_users_path
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json[1]["name"]).to eq "FirstUser" # 先にauthorization_mocの中の@current_user = FactoryBot.create(:user)が動くため[1]
      expect(json.count).to eq(user_num + 2)
    end
  end
end
