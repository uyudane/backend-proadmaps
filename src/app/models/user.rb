class User < ApplicationRecord
  has_many :roadmaps, dependent: :destroy

  validates :name, presence:true

  def self.from_token_payload(payload)
    # すでにユーザ情報があった場合はその情報を取得
    # ユーザ登録をしたタイミングの場合は、ユーザテーブルにsubとユーザ名を追加
    find_by(sub: payload['sub'].split("|")[1]) || create!(sub: payload['sub'].split("|")[1],name: payload['.name'])
  end
end
