class LikeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :roadmap_id

  belongs_to :user, serializer: UserSerializer
  belongs_to :roadmap, serializer: RoadmapSerializer
end
