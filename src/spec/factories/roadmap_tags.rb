FactoryBot.define do
  factory :roadmap_tag do
    association :roadmap
    association :tag
  end
end
