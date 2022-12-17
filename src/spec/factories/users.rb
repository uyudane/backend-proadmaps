FactoryBot.define do
  factory :user do
    name {"name"}
    sequence(:sub) { |n| "sub#{n}" }
    avatar {"avatar"}
    github_account {"github_account"}
    twitter_account {"twitter_account"}
  end
end
