class Step < ApplicationRecord
  belongs_to :roadmap

  validates :title, presence: true
  validates :step_number, presence: true
end
