class Roadmap < ApplicationRecord
  belongs_to :user
  has_many :roadmap_tags, dependent: :destroy
  has_many :tags, through: :roadmap_tags
  has_many :steps, dependent: :destroy

  validates :title, presence:true

  def save_with_tags_steps(tag_list:,step_list: [])
    ActiveRecord::Base.transaction do
      # Tagが既にあればそのオブジェクトを、なければ新しくタグを作成して作成後のオブジェクトを返し、
      # self.tagsに代入することでロードマップとタグを紐づける
      self.tags = tag_list.map { |name| Tag.find_or_initialize_by(name: name.strip) }

      # 取得したstep情報とインデックス(配列の順番)を使用して、ロードマップに紐づいたstep情報を作成する
      step_list.each.with_index do |step,index|
        self.steps.build(url: step[:url],title: step[:title],introduction: step[:introduction],required_time: step[:required_time],year: step[:year], month: step[:month], step_number: (index+1))
      end
      save!
    end
    true
  rescue StandardError
    false
  end
end
