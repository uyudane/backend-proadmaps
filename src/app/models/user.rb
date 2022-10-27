class User < ApplicationRecord
  has_many :roadmaps, dependent: :destroy

  def self.from_token_payload(payload)
    # すでにユーザ情報があった場合はその情報を取得
    # ユーザ登録をしたタイミングの場合は、ユーザテーブルにsubとユーザ名を追加
    find_by(sub: payload['sub']) || create!(sub: payload['sub'],name: payload['.name'])
  end
end
