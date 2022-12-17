こちらは「ProadMaps」のバックエンドのリポジトリになります。フロントエンドのソースは
[こちら](https://github.com/uyudane/frontend_proadmaps)です。

## ProadMaps 〜プログラミング学習のロードマップ/学習記録 共有サイト〜
[https://proadmaps.com/](https://proadmaps.com/)

## 作成の背景とサービスの概要
現在、プログラミングを学習するにあたって、**書籍や動画、ハンズオンサービスなど、有料/無料、公式/非公式のものを含めてさまざまなサービス**があります。
<br>良い教材を探したいと思ってレビューを見ると、「初心者には難しすぎ★3」や、「欲しかった情報はなく物足りない★2」といったものがありますが、それは教材の内容が悪いのではなく、実施順序が悪いのではないのかなと感じ、そうであれば**先に学習するべき教材、実施後に学習すべき教材を教えてほしいな**と思っていました。
<br>また、プログラミング学習というのは人によって開始時のスキルや教材の嗜好が異なるため、複数のロードマップを比較して自分に合ったロードマップを参考にできるのがベストだなと思っていましたが、**既存のサイトに載っているロードマップはフォーマット、情報量がバラバラで比較しづらい**と感じておりました。
<br>そういった背景から、**どういった学習教材をどの順番で学習するべきか、一定のフォーマットで記載されているロードマップを、まとめて見れるサービス**があれば...!と考え、本サービスを開発しました。

## 作成できるロードマップの形式
一つの「ロードマップ」に、「ステップ」という名前で、使用する教材(書籍、動画、コンテンツ等)を複数紐づけて投稿することができます。
<br>**①ロードマップ**
- タイトル
- 概要
- タグ
- 開始時スキル
- 終了時しスキル
- 総ステップ数

<br>**②ステップ**
- 教材名(URLから自動取得)
- 紹介文/コメント
- 所用時間
- 実施年月
- OGP情報(URLから自動取得)

例. https://proadmaps.com/1506616851853242371/roadmaps/14
[![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/2710784/5726cd16-44fd-e2a4-a55b-51bb2136a29b.png)](https://proadmaps.com/1506616851853242371/roadmaps/14)

## 主な使用技術

![image](https://user-images.githubusercontent.com/103183815/204979763-a9fb0ea1-d71e-4810-bc08-0c8d381e1ded.png)

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

## ER図
![image](https://user-images.githubusercontent.com/103183815/204979248-0ef2d51f-efed-4edb-a464-15bb63f4fc49.png)

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
- ユーザの入力が楽になる&何を入力すればいいかわかるように、MUIのAutoCompleteを使用して、記入案からの選択と、自由記述の両方できるようにしている。
[![Image from Gyazo](https://i.gyazo.com/5df4770164ea64a222540ef9bc9db158.gif)](https://gyazo.com/5df4770164ea64a222540ef9bc9db158)

2. ステップ作成
- 一つのロードマップの中で、タイトル、URL、説明等を設定した学習教材を複数設定することができる。
- 登録したURLから、Next.jsのAPIルートを利用して、メタタグからサイトタイトルを取得する。
- ReactDnDを利用して、ドラックアンドドロップでステップの順番を変更することができる。
[![Image from Gyazo](https://i.gyazo.com/3be9b39f105682e4558b14c1efa89599.gif)](https://gyazo.com/3be9b39f105682e4558b14c1efa89599)

3. 確認
- 投稿したロードマップを、他ユーザに表示される形式で、事前に確認することができる。

**ロードマップ下書き一覧機能**
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

## Qiita記事
[サービス紹介記事](https://qiita.com/uyudane/items/fa4ec11b13002f0cd3c5)

## 10/17スケジューリング&実績
1. 企画(アイデア企画・技術調査)：10/16
2. 設計(README、画面遷移図、ER 図の作成)：10/23 〆切 →10/22実施
3. メイン機能実装：11/20 〆切
4. MVP リリース：11/20 →11/22実施
5. 本番リリース：11 月末 →12/2実施
