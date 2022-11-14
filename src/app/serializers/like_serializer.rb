# frozen_string_literal: true

class LikeSerializer < ActiveModel::Serializer
  attributes :id, :roadmap_id, :user_sub

  belongs_to :user, serializer: UserSerializer
  belongs_to :roadmap, serializer: RoadmapSerializer

  def user_sub
    object.user.sub
  end
end
