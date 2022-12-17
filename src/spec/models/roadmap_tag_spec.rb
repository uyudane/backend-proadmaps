require 'rails_helper'

RSpec.describe RoadmapTag, type: :model do
  let(:roadmap_tag) { FactoryBot.create(:roadmap_tag) }

  it "全ての要素が含まれている場合は有効な状態であること" do
    expect(roadmap_tag).to be_valid
  end

  it "roadmap_idがなければ無効な状態であること" do
    roadmap_tag.roadmap = nil
    roadmap_tag.valid?
    expect(roadmap_tag.errors[:roadmap]).to include("must exist")
  end

  it "tag_idがなければ無効な状態であること" do
    roadmap_tag.tag = nil
    roadmap_tag.valid?
    expect(roadmap_tag.errors[:tag]).to include("must exist")
  end

end
