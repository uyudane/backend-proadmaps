require 'rails_helper'

RSpec.describe User, type: :model do
  it "全ての要素が含まれている場合は有効な状態であること" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "nameとsubとavatarがあれば有効な状態であること" do
    user = User.new(
      name: "name1",
      sub: "12345",
      avatar: "avatar1",
    )
    expect(user).to be_valid
  end

  it "nameがなければ無効な状態であること" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "subがなければ無効な状態であること" do
    user = FactoryBot.build(:user, sub: nil)
    user.valid?
    expect(user.errors[:sub]).to include("can't be blank")
  end

  it "avatarがなければ無効な状態であること" do
    user = FactoryBot.build(:user, avatar: nil)
    user.valid?
    expect(user.errors[:avatar]).to include("can't be blank")
  end
end
