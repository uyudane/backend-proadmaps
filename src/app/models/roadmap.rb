class Roadmap < ApplicationRecord
  belongs_to :user
  has_many :roadmap_tags, dependent: :destroy
  has_many :tags, through: :roadmap_tags

  def save_with_tags(tag_list)
    ActiveRecord::Base.transaction do
      self.tags = tag_list.map { |name| Tag.find_or_initialize_by(name: name.strip) }
      save!
    end
    true
  rescue StandardError
    false
  end
end
