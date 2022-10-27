3.times do |n|
  user = User.create!(
    sub: "12345_#{n+1}",
  )

  5.times do |m|
    user.roadmaps.create!(
      title: "ロードマップ_#{n+1}",
      introduction: "説明",
    )
  end

  user.create_profile(
    name: "name_#{n+1}",
    github_account: "git_#{n+1}",
    twitter_account: "twitter_#{n+1}",
  )
end
