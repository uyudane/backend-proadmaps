# frozen_string_literal: true

class User < ApplicationRecord
  has_many :roadmaps, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_roadmaps, through: :likes, source: :roadmap

  validates :name, presence: true
  validates :avatar, presence: true
  validates :sub, presence: true

  def self.from_token_payload(payload)
    # すでにユーザ情報があった場合はその情報を取得
    # ユーザ登録をしたタイミングの場合は、ユーザテーブルにsubとユーザ名を追加
    # ユーザ名は、メールアドレスの場合はusernameから、SNSの場合はnameから取る(emailだとnameがメールアドレスになる)
    find_by(sub: payload["sub"].split("|")[1]) || create!(sub: payload["sub"].split("|")[1],
                                                          name: payload[".username"] || payload[".name"], avatar: payload[".picture"])
  end

  def like(roadmap)
    like_roadmaps << roadmap
  end

  def unlike(roadmap)
    like_roadmaps.destroy(roadmap)
  end

  def like?(roadmap)
    like_roadmaps.include?(roadmap)
  end
end
