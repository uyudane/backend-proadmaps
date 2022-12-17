require 'rails_helper'

RSpec.describe Step, type: :model do

  let(:roadmap) {FactoryBot.create(:roadmap)}

  it "全ての要素が含まれている場合は有効な状態であること" do
    step = FactoryBot.build(:step)
    expect(step).to be_valid
  end

  it "ロードマップとタイトルとステップナンバーがあれば有効な状態であること" do
    step = Step.new(
      roadmap: roadmap,
      title: "step-title",
      step_number: "1",
    )
    expect(step).to be_valid
  end

  it "titleがなければ無効な状態であること" do
    step = FactoryBot.build(:step, title: nil)
    step.valid?
    expect(step.errors[:title]).to include("can't be blank")
  end

  it "step_numberがなければ無効な状態であること" do
    step = FactoryBot.build(:step, step_number: nil)
    step.valid?
    expect(step.errors[:step_number]).to include("can't be blank")
  end

  it "roadmapがなければ無効な状態であること" do
    step = FactoryBot.build(:step, roadmap: nil)
    step.valid?
    expect(step.errors[:roadmap]).to include("must exist")
  end

end
