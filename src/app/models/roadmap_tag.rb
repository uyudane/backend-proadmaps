# frozen_string_literal: true

class RoadmapTag < ApplicationRecord
  belongs_to :roadmap
  belongs_to :tag

  # ロードマップごとに重複して同じタグをつけられないように制御
  validates :tag_id, uniqueness: { scope: :roadmap_id }
end
