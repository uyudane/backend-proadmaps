require 'rails_helper'

RSpec.describe Roadmap, type: :model do
  before do
    @user = User.create(
      name: "name1",
      sub: "sub1",
      avatar: "avatar1",
      github_account: "github_account1",
      twitter_account: "twitter_account1",
    )
  end

  it "全ての要素が含まれている場合は有効な状態であること" do
    roadmap = Roadmap.new(
      user: @user,
      title: "title1",
      introduction: "introduction1",
      start_skill: "start_skill1",
      end_skill: "end_skill1",
      is_published: true,
    )
    expect(roadmap).to be_valid
  end

  it "ユーザーとタイトルがあれば有効な状態であること" do
    roadmap = Roadmap.new(
      user: @user,
      title: "title1",
    )
    expect(roadmap).to be_valid
  end

  it "titleがなければ無効な状態であること" do
    roadmap = Roadmap.new(
      user: @user,
      # title: "title1",
      introduction: "introduction1",
      start_skill: "start_skill1",
      end_skill: "end_skill1",
      is_published: true,
    )
    roadmap.valid?
    expect(roadmap.errors[:title]).to include("can't be blank")
  end

  it "userがなければ無効な状態であること" do
    roadmap = Roadmap.new(
      # user: @user,
      title: "title1",
      introduction: "introduction1",
      start_skill: "start_skill1",
      end_skill: "end_skill1",
      is_published: true,
    )
    roadmap.valid?
    expect(roadmap.errors[:user]).to include("must exist")
  end
end
