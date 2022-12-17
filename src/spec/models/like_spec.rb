require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { FactoryBot.create(:like) }

  it "全ての要素が含まれている場合は有効な状態であること" do
    expect(like).to be_valid
  end

  it "user_idがなければ無効な状態であること" do
    like.user = nil
    like.valid?
    expect(like.errors[:user]).to include("must exist")
  end

  it "roadmap_idがなければ無効な状態であること" do
    like.roadmap = nil
    like.valid?
    expect(like.errors[:roadmap]).to include("must exist")
  end

end
