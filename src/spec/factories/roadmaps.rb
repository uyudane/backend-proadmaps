FactoryBot.define do
  factory :roadmap do
    association :user
    title { "title1" }
    introduction { "introduction1" }
    start_skill { "start_skill1" }
    end_skill { "end_skill1" }
    is_published { true }
  end
end
