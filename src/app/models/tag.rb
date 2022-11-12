class Tag < ApplicationRecord
  has_many :roadmap_tags, dependent: :destroy
  has_many :roadmaps, through: :roadmap_tags

  validates :name, presence: true, uniqueness: true
end
