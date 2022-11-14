# frozen_string_literal: true

class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :roadmap_ids

  def roadmap_ids
    object.roadmaps.map(&:id)
  end
end
