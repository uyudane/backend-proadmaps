# frozen_string_literal: true

class RoadmapSerializer < ActiveModel::Serializer
  attributes :id, :title, :introduction, :created_date, :start_skill, :end_skill, :is_published, :number_of_likes

  belongs_to :user, serializer: UserSerializer
  has_many :tags, serializer: TagSerializer
  has_many :steps, serializer: StepSerializer
  has_many :likes, serializer: LikeSerializer

  def number_of_likes
    object.likes.length.to_s
  end

  def created_date
    object.created_at.strftime('%Y年%m月%d日')
  end

end
