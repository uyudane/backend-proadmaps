3.times do |n|
  user = User.new(
    sub: "12345_#{n+1}",
  )

  5.times do |m|
    user.roadmaps.build(
      title: "ロードマップ_#{n+1}",
      introduction: "説明",
    )
  end

  user.save!
end
