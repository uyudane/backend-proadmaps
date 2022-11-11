class UserSerializer < ActiveModel::Serializer
  attributes :sub, :name, :github_account, :twitter_account

  has_many :roadmaps, serializer: RoadmapSerializer
  has_many :likes, serializer: LikeSerializer
end
