# DB の設計書

## Users テーブル (ユーザー情報を格納)

- id: 主キー
- name : ユーザ名
- email : メールアドレス
- avatar : アイコンイメージ
- github_account : 公開用 Github アカウント(外部ログインのアカウントとは別に、https://github.com/ のうしろのユーザ ID だけ登録してもらうイメージ)
- twitter_account : 公開用 Twitter アカウント(外部ログインのアカウントとは別に、https://twitter.com/ のうしろのユーザ ID だけ登録してもらうイメージ)
- crypted_password : Sorcery で作成される認証用のカラム
- salt : Sorcery で作成される認証用のカラム

## Notices テーブル (通知情報を格納)

- id : 主キー
- user_id : 外部キー(Users テーブル)
- subject_id : 外部キー(Comments/Likes/Stocks/Recomends テーブルとポリモーフィック関連付けを行う)
- action_type : Comments/Likes/Stocks/Recomends ごとに、実施する通知アクションを管理する。
- read : 通知の既読管理をする。

## Comments テーブル (ロードマップへのコメント情報を格納)

- id : 主キー
- user_id : 外部キー(Users テーブル)
- roadmap_id : 外部キー(Roadmaps テーブル)
- body : コメント本文

## Likes テーブル (ロードマップへの「感謝」情報を格納)

- id : 主キー
- user_id : 外部キー(Users テーブル)
- roadmap_id : 外部キー(Roadmaps テーブル)

## Stock テーブル (ステップへの「興味」情報を格納)

- id : 主キー
- user_id : 外部キー(Users テーブル)
- step_id : 外部キー(Steps テーブル)

## Recomends テーブル (ステップへの「推し」情報を格納)

- id : 主キー
- user_id : 外部キー(Users テーブル)
- step_id : 外部キー(Steps テーブル)

## Roadmaps テーブル(ロードマップの情報を格納)

- id : 主キー
- user_id : 外部キー(Users テーブル)
- title : タイトル
- introduction : 説明/導入文
- start_skil : 開始時想定スキル(「プログラミング初心者」、「別言語の学習経験あり」「実務での使用経験あり」等を想定)
- end_skil : 目標/ゴール(「ポートフォリオ作成」、「実務使用」等を想定)
- status : ステータス(「公開」、「下書き」を enum で管理)

## Roadmap_Tag テーブル(ロードマップテーブルとタグテーブルの中間テーブル)

- id : 主キー
- roadmap_id : 外部キー(roadmaps テーブル)
- tag_id : 外部キー(tags テーブル)

## Tags テーブル(タグデータを格納)

- id : 主キー
- name : タグ名

## Steps テーブル(ステップデータを格納)

- id : 主キー
- roadmap_id : 外部キー(roadmmaps テーブル)
- URL : サービスの URL(ブックマーク的に使用)
- title string : タイトル
- introduction : 説明文
- required_time : 所要時間
- date : 実施年月
- step_number : ロードマップの何ステップ目かを記録

## External_sites (外部サイト同時検索で使用するサイト情報を格納)

- id : 主キー
- name : 名前(「Udemy」、「Progate」等を想定)
- base_url ベースの URL(例えば Udemy で ruby と検索する際、「https://www.udemy.com/courses/search/?src=ukw&q=ruby」というURLになるが、そのうちの「https://www.udemy.com/courses/search/?src=」をベースのurlとして登録する。)
