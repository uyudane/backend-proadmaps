こちらは「ProadMaps」のバックエンドのリポジトリになります。フロントエンドのソースは
[こちら](https://github.com/uyudane/frontend_proadmaps)です。

## ProadMaps 〜プログラミング学習のロードマップ/学習記録 共有サイト〜

## サービス概要

プログラミング学習において、何の教材をどの順番で学習していくべきか困っている駆け出しエンジニアに、
<br>先輩エンジニアが行ってきた学習ロードマップを提供するサービスです。

## 主な使用技術

### 認証

- Auth0

### バックエンド

- Ruby(3.1.2)
- Ruby&nbsp;on&nbsp;Rails(7.0.4)\*API モード
- Docker / Docker Compose

### フロントエンド

- Typescript
- React(18.2.0)
- Next.js(12.3.1)
- Recoil
- Axios
- SWR
- MUI

### インフラ
1. フロントエンド
- Vercel

2. バックエンド ※
- Amazon ECS(Fargate)
- Amazon ECR
- Amazon Route53
- AWS Certificate Manager
- Application Load Balancer
- RDS(MySQL)
- CircleCIを使用したCI/CD

※ ユーザに使用してもらう向けのHerokuにデプロイしたリポジトリと、[Amazon ECSにデプロイしたレポジトリ](https://github.com/uyudane/ecs_backend_portfolio)があり、本リポジトリはHerokuにデプロイしたものになります。

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

## 実装機能

### 一般ユーザ向け

**ユーザ登録/ログイン機能**
- Github/Twitter/メールアドレスを利用してユーザ登録/ログインをすることができる。
- メールアドレスで登録した際に、パスワードを忘れてもパスワードをリセットすることができる。
![image](https://user-images.githubusercontent.com/103183815/204941715-85e67e5f-d6dc-4354-b58f-47033e382ab0.png)

**ロードマップ一覧/検索機能**
- Next.jsのISRを使用して、ビルド時にHTMLファイルを生成&一定時間ごとにバックグラウンドでデータの再取得およびページの再レンダリングを行っているため、ユーザーのリクエストに対して、高速に新しい情報を提供する。
- タグとフリーワードで、投稿されたロードマップを検索することができる。
[![Image from Gyazo](https://i.gyazo.com/2e6fbec4b70fd1c7ebca050875a0a849.gif)](https://gyazo.com/2e6fbec4b70fd1c7ebca050875a0a849)

**ロードマップ詳細/いいね/共有機能**
- Next.jsのISRを使用して、高速に新しい情報を提供する。
- 作成時に登録したコンテンツのURLをもとに、Next.jsのAPIルートを利用して、サイトのメタタグを取得し、OGP情報を表示する。
- ロードマップへのいいねができる。
![image](https://user-images.githubusercontent.com/103183815/204943085-0f65f9c4-e148-4923-8422-6358f69aaf37.png)
- vercel/ogライブラリを使用してTwitter投稿時の動的OGPを作成
![image](https://user-images.githubusercontent.com/103183815/204944558-8597bd57-116b-44bf-804d-26d4a7189ef0.png)
- 作成したロードマップをMarkdownで出力。
![image](https://user-images.githubusercontent.com/103183815/204944141-5ecb98c2-8222-4662-b90e-a101c8332b01.png)
https://qiita.com/niboshi_uyudane/items/3afd709d7c7dec22e267


**ロードマップ新規作成/編集/下書き機能**
1. ロードマップ/学習記録の概要作成
- タイトル、タグ、開始時スキル等を設定したロードマップの投稿、更新、削除をすることができる。
[![Image from Gyazo](https://i.gyazo.com/5df4770164ea64a222540ef9bc9db158.gif)](https://gyazo.com/5df4770164ea64a222540ef9bc9db158)

2. ステップ作成
- 一つのロードマップの中で、タイトル、URL、説明等を設定した学習教材を複数設定することができる。
- 登録したURLから、Next.jsのAPIルートを利用して、メタタグからサイトタイトルを取得する。
- ReactDnDを利用して、ドラックアンドドロップでステップの順番を変更することができる。
[![Image from Gyazo](https://i.gyazo.com/3be9b39f105682e4558b14c1efa89599.gif)](https://gyazo.com/3be9b39f105682e4558b14c1efa89599)

3. 確認
- 投稿したロードマップを、他ユーザに表示される形式で、事前に確認することができる。

**ロードマップ下書き一覧機能
- 下書きしたロードマップを一覧で表示することができる。

**プロフィール詳細/編集機能**
- 各ユーザのユーザ情報、投稿/いいねしたロードマップを見ることができる。
- 自身のユーザ情報(ユーザ名、Github/Twitterアカウント)を編集、登録できる
![image](https://user-images.githubusercontent.com/103183815/204946825-341ef366-abfa-465c-bf1a-7a7641cf941f.png)

### 管理ユーザ向け

**管理機能**
- 管理ユーザでログインすることで、ユーザと、ロードマップを管理することができる。

### その他
- PC、スマートフォン、タブレットに合わせたレスポンシブデザインに対応。(スマホではロードマップ作成、編集機能は使用不可)

## 画面遷移図

[Figma\_画面遷移図](https://www.figma.com/file/0mi3TY1BTtcFXcVaOYVloi/%E3%83%9D%E3%83%BC%E3%83%88%E3%83%95%E3%82%A9%E3%83%AA%E3%82%AA?node-id=0%3A1)
<br>[カスタマージャーニーマップ](https://docs.google.com/spreadsheets/d/1GzpPlzdImhLdQxsnRQElXNBPGJt_X86fwO713I8Jfdo/edit?usp=sharing)

## DB 設計

[ER 図](https://raw.githubusercontent.com/uyudane/portfolio-backend/918501942c1535b6a47e9ee6a8224300487ce118/DB_design/ERD.svg)
<br>[テーブル定義](https://github.com/uyudane/portfolio-backend/blob/main/DB_design/DB_description.md)

## 10/17スケジューリング&実績

1. 企画(アイデア企画・技術調査)：10/16
2. 設計(README、画面遷移図、ER 図の作成)：10/23 〆切 →10/22実施
3. メイン機能実装：11/20 〆切
4. MVP リリース：11/20 →11/22実施
5. 本番リリース：11 月末
