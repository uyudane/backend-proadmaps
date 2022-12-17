require 'rails_helper'

RSpec.describe Roadmap, type: :model do

  let(:user) {FactoryBot.create(:user)}

  it "全ての要素が含まれている場合は有効な状態であること" do
    roadmap = FactoryBot.build(:roadmap)
    expect(roadmap).to be_valid
  end

  it "ユーザーとタイトルがあれば有効な状態であること" do
    roadmap = Roadmap.new(
      user: user,
      title: "title1",
    )
    expect(roadmap).to be_valid
  end

  it "titleがなければ無効な状態であること" do
    roadmap = FactoryBot.build(:roadmap, title: nil)
    roadmap.valid?
    expect(roadmap.errors[:title]).to include("can't be blank")
  end

  it "userがなければ無効な状態であること" do
    roadmap = FactoryBot.build(:roadmap, user: nil)
    roadmap.valid?
    expect(roadmap.errors[:user]).to include("must exist")
  end
end
