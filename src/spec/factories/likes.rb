FactoryBot.define do
  factory :like do
    association :user
    association :roadmap
  end
end
