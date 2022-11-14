class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :roadmap_ids

  def roadmap_ids
    object.roadmaps.map { |roadmap| roadmap.id }
  end
end
