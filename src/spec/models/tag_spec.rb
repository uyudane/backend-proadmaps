require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { FactoryBot.create(:tag) }

  it "タグの名前がある場合、有効な状態であること" do
    expect(tag).to be_valid
  end

  it "タグの名前がある場合、有効な状態であること" do
    tag.name = nil
    tag.valid?
    expect(tag.errors[:name]).to include("can't be blank")
  end

end
