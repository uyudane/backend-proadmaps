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
      self.tags = tag_list.map { |tag| Tag.find_or_initialize_by(name: tag[:name].strip) }

      # 取得したstep情報とインデックス(配列の順番)を使用して、ロードマップに紐づいたstep情報を作成する
      step_list.each.with_index do |step,index|
        step_params = step.permit(:url,:title,:introduction,:required_time, :year,:month).merge(step_number: index+1)
        self.steps.build(step_params)
      end
      save!
    end
    true
  rescue StandardError
    false
  end

  def update_with_tags_steps(tag_list:,step_list: [],roadmap_params:)
    ActiveRecord::Base.transaction do
      # Tagが既にあればそのオブジェクトを、なければ新しくタグを作成して作成後のオブジェクトを返し、
      # self.tagsに代入することでロードマップとタグを紐づける
      # updateの場合でも、同様の記載でよい
      # 新たに関連づけられると、元あったタグは、中間テーブルから削除される
      self.tags = tag_list.map { |tag| Tag.find_or_initialize_by(name: tag[:name].strip) }

      # 取得したstep情報とインデックス(配列の順番)を使用して、ロードマップに紐づいたstep情報を作成する
      step_list.each.with_index do |step,index|
        if self.steps.find_by_id(step[:id])
          target_step = self.steps.find(step[:id])
        step_params = step.permit(:url,:title,:introduction,:required_time, :year,:month).merge(step_number: index+1)
          target_step.update!(step_params)
        else
          step_params = step.permit(:url,:title,:introduction,:required_time, :year,:month).merge(step_number: index+1)
          self.steps.build(step_params)
        end
      end
      update!(roadmap_params)
    end
    true
  rescue StandardError
    false
  end
end
