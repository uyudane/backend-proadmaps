# frozen_string_literal: true

class RoadmapSerializer < ActiveModel::Serializer
  attributes :id, :title, :introduction, :created_at, :start_skill, :end_skill, :is_published

  belongs_to :user, serializer: UserSerializer
  has_many :tags, serializer: TagSerializer
  has_many :steps, serializer: StepSerializer
  has_many :likes, serializer: LikeSerializer
end
