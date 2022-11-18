# README

## サービス概要

プログラミング学習をどのように行なっていくか困っている駆け出しエンジニアに、
<br>先輩エンジニアが行ってきた学習ロードマップを提供する、
<br>学習ロードマップ共有サービスです。

## 使用技術

### 認証

- Auth0

### バックエンド

- Ruby(3.1.2)
- Ruby&nbsp;on&nbsp;Rails(7.0.4)\*API モード

### フロントエンド

- Typescript
- React(18.2.0)
- Next.js(12.3.1)
- Recoil
- Axios
- MUI
- SWR

## メインのターゲットユーザー

- 転職を目標としている駆け出しエンジニア
- 新しい技術をキャッチアップしたい新米エンジニア

## ユーザーが抱える課題

プログラミングの学習を選択するにあたって、書籍や動画、ハンズオンサービスなど、有料/無料、公式/非公式のものを含めてさまざまなサービスがあり、受講者のスキルレベルによっても最適な学習教材は異なります。
<br>教材ごとのレビューは各サイトに載っていることがありますが、その教材の前後にどのような教材を実施するべきかは記載されていないことが多いです。
<br>特に、入門用の参考書と中級者向けの学習教材の難易度差は大きく、その壁を乗り越えるために複数の教材を適切な順番で実施していくことは、初心者にとっては難易度が高いです。
<br>その結果、教材選び、学習方法を誤って挫折してしまう可能性があります。

## 解決方法

先輩エンジニアが学習を進めてきたロードマップを参考にすることで、良い教材を適切な順番で学習できるようにします。

## 実装予定の機能

### 一般ユーザ向け

**ユーザ登録/ログイン機能**

- Github/Twitter/メールアドレスを利用してユーザ登録/ログインすることができる。
- メールアドレスで登録した際に、パスワードを忘れてもパスワードをリセットすることができる。

**ロードマップ投稿機能**

- タイトル、タグ、開始時スキル等を設定したロードマップの投稿、更新、削除をすることができる。
- 一つのロードマップの中で、タイトル、URL、コメント等を設定した学習教材を複数設定することができる。
- ロードマップを投稿した際に、投稿内容を Twitter で投稿できるように反映させることができる。
- 投稿したロードマップについて、別サイト(Qiita 等を想定)にも転記できるように、マークダウン形式でダウンロードすることができる。(投稿者にもメリットがあるように、ロードマップ作成ツールみたいな意味合いも持たせたい。)

**ロードマップ検索機能**

- タグ(Rails、AWS、React 等の技術名を想定)で、投稿されたロードマップを検索することができる。
- 投稿された順、いいね順で並び替えることができる。
- (サブ機能として)投稿されたロードマップを検索する際に、選択した外部サイト(Udemy やドットインストール等を想定)を同時に検索して、検索結果(外部サイトの検索結果ページ)を別タブで表示させることができる。

**いいね/ストック/コメント機能**

- ロードマップ自体と、その中に設定された学習教材ごとに、いいね/ストック/コメントをすることができる。

**通知機能**

- ロードマップ投稿機能の中で実装した、いいね/ストック/コメントがあった際に、投稿者へ通知をすることができる。

### 管理ユーザ向け

**管理機能**

- 管理ユーザを作成して、一般ユーザと、投稿されたコンテンツを管理することができる。

## なぜこのサービスを作りたいのか？

SIer 時代に独学でプログラミングを学習しようとして挫折した経験と、
<br>プログラミングスクールに入り学習をした経験から、
<br>以下の二つの課題を感じて、本サービスを作成したいと考えました。

- さまざまな学習サービスがあるにも関わらず、一般的に認知されていない
- さまざまな学習サービスから、良い教材を適切な順番で学習していくのはかなり難易度が高い

## 画面遷移図

[Figma\_画面遷移図](https://www.figma.com/file/0mi3TY1BTtcFXcVaOYVloi/%E3%83%9D%E3%83%BC%E3%83%88%E3%83%95%E3%82%A9%E3%83%AA%E3%82%AA?node-id=0%3A1)
<br>[カスタマージャーニーマップ](https://docs.google.com/spreadsheets/d/1GzpPlzdImhLdQxsnRQElXNBPGJt_X86fwO713I8Jfdo/edit?usp=sharing)

## DB 設計

[ER 図](https://raw.githubusercontent.com/uyudane/portfolio-backend/918501942c1535b6a47e9ee6a8224300487ce118/DB_design/ERD.svg)
<br>[テーブル定義](https://github.com/uyudane/portfolio-backend/blob/main/DB_design/DB_description.md)

## スケジュール

1. 企画(アイデア企画・技術調査)：10/16 〆切
2. 設計(README、画面遷移図、ER 図の作成)：10/23 〆切
3. メイン機能実装：11/20 〆切
4. MVP リリース：11/20
5. 本番リリース：11 月末
