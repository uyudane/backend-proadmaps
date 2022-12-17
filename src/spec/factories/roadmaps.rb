FactoryBot.define do
  factory :roadmap do
    association :user
    title { "title1" }
    introduction { "introduction1" }
    start_skill { "start_skill1" }
    end_skill { "end_skill1" }
    is_published { true }

    after(:create) do |roadmap|
      create_list(:roadmap_tag, 1, roadmap: roadmap, tag: create(:tag))
    end
  end
end
