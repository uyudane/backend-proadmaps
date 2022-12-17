FactoryBot.define do
  factory :step do
    association :roadmap
    url { "step-url" }
    title { "step-title" }
    introduction { "step-introduction" }
    required_time { "required_time" }
    year { "2000" }
    month { "12" }
    step_number { "1" }
  end
end
