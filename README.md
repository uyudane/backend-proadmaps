こちらは「ProadMaps」のバックエンドのリポジトリになります。フロントエンドのソースは
[こちら](https://github.com/uyudane/frontend_proadmaps)です。

## ProadMaps 〜プログラミング学習のロードマップ/学習記録 共有サイト〜
[https://proadmaps.com/](https://proadmaps.com/)


## サービス概要

プログラミング学習において、何の教材をどの順番で学習していくべきか困っている駆け出しエンジニアに、
<br>先輩エンジニアが行ってきた学習ロードマップを提供するサービスです。

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

## 苦労した点・工夫した点
ロードマップに紐づくステップの作成、編集機能の作成に苦労しました。
<br>フロントエンド側では、新規作成、下書きからの更新、作成済みのロードマップの編集で同じコンポーネントを使用したため、初期値の設定に苦労しました。また、作成済みロードマップの更新機能では、古いステップの一部が削除されたり、編集されたり、新規作成のステップが元のステップより前の順番に移動されたりする際の挙動を、Recoilでの配列の状態管理とReactDnDでの順番の入れ替えで実装するのに苦労しました。
<br>また、バックエンドでは、作成済みロードマップの更新機能において、上記のようなステップの更新があった際に、もともとDBに登録されているデータの一部が更新、一部は削除といった処理を行う必要があり、実装に苦労しました。

### フロントエンド

- ステップの順番変更処理の一部抜粋(DndStepContainer.tsx)
```DndStepContainer.tsx
  const [steps, setSteps] = useRecoilState(stepsState);
  const moveStep = useCallback((dragIndex: number, hoverIndex: number) => {
    setSteps((prevSteps: Step[]) =>
      update(prevSteps, {
        $splice: [
          // ドラッグしたindexの値を削除
          [dragIndex, 1],
          // ホバーした先のインデックスに挿入する
          [hoverIndex, 0, prevSteps[dragIndex] as Step],
        ],
      }),
    );
  }, []);
```

- ステップの新規作成・編集処理の一部抜粋(CreateStepDialog.tsx)
```CreateStepDialog.tsx
// 編集時に使用する関数。編集するオブジェクトの値を変更して、前後は元の値で上書く。
const replaceItemAtIndex = (arr: Step[], index: number, newValue: Step) => {
  return [...arr.slice(0, index), newValue, ...arr.slice(index + 1)];
};
...
  // フォーム送信時の処理
  const onSubmit: SubmitHandler<Step> = async (data) => {
    // 新規作成時の処理(配列に新しいオブジェクトを追加)
    if (typeof index === 'undefined') {
      setSteps((oldSteps) => [
        ...oldSteps,
        {
          // 新規作成時はgetStepId()が渡されている想定
          id: currentStep?.id || getStepId!(),
          url: data.url,
          title: data.title,
          introduction: data.introduction,
          required_time: data.required_time,
          year: data.year,
          month: data.month,
          // step_numberは表示の際に使用するもので、作成時には関係ないためnullを入れる
          step_number: null,
        },
      ]);
      reset();
    } else {
      // 編集時の処理(配列の指定の値を変更する)
      const newList = replaceItemAtIndex(steps, index, {
        //index === 'undefined出ない時点で、idに値が入っている想定
        id: currentStep.id as number,
        url: data.url,
        title: data.title,
        introduction: data.introduction,
        required_time: data.required_time,
        year: data.year,
        month: data.month,
        // step_numberは表示の際に使用するもので、作成時には関係ないためnullを入れる
        step_number: null,
      });
      setSteps(newList);
    }
    handleClose();
  };
```

- ステップの削除の一部抜粋(DeleteStepButton.tsx)
``` DeleteStepButton.tsx
const removeItemAtIndex = (arr: Step[], index: number) => {
  return [...arr.slice(0, index), ...arr.slice(index + 1)];
};
const DeleteStepButton = ({ index }: { index: number }) => {
  const [steps, setSteps] = useRecoilState(stepsState);
  const deleteItem = () => {
    const newList = removeItemAtIndex(steps, index);
    setSteps(newList);
  };
  return (
    <>
      <Button variant='text' onClick={deleteItem}>
        削除
      </Button>
    </>
  );
};
```

### バックエンド

ロードマップコントローラーのupdateメソッド(roadmaps_controller.rb)
``` roadmaps_controller.rb
  def update
    # ユーザー認証
    tag_list = params[:tags]
    step_list = params[:steps]
    if @roadmap.update_with_tags_steps(tag_list:, step_list:, roadmap_params:)
      render json: @roadmap, status: 200
    else
      render_500(nil, @roadmap.errors.full_messages)
    end
  end
```

ロードマップモデルのupdate_with_tags_stepsメソッド(roadmap.rb)
``` roadmap.rb
def update_with_tags_steps(tag_list:, roadmap_params:, step_list: [])
    ActiveRecord::Base.transaction do
      # Tagが既にあればそのオブジェクトを、なければ新しくタグを作成して作成後のオブジェクトを返し、
      # self.tagsに代入することでロードマップとタグを紐づける
      # updateの場合でも、同様の記載でよい
      # 新たに関連づけられると、元あったタグは、中間テーブルから削除される
      self.tags = tag_list.map { |tag| Tag.find_or_initialize_by(name: tag[:name].strip) }
      # 現在ロードマップに紐づいているstepのidを確認(今回のリクエストで存在しなかったものを削除するために使用)
      current_id = steps.map { |step| step[:id] }
      # 取得したstep情報とインデックス(配列の順番)を使用して、ロードマップに紐づいたstep情報を作成する
      step_list.each.with_index do |step, index|
        step_params = step.permit(:url, :title, :introduction, :required_time, :year,
                                  :month).merge(step_number: index + 1)
        # 新しいステップの場合は新しく作成する
        if steps.find_by_id(step[:id]).nil?
          steps.build(step_params)
        else
          # 既存のステップの場合は上書きする
          steps.find_by_id(step[:id]).update!(step_params)
          # 削除対象idリストから外す
          current_id.delete(step[:id])
        end
      end
      current_id.each { |id| Step.find(id).destroy! }
      update!(roadmap_params)
    end
    true
  rescue StandardError
    false
  end
```


## 画面遷移図

[Figma\_画面遷移図](https://www.figma.com/file/0mi3TY1BTtcFXcVaOYVloi/%E3%83%9D%E3%83%BC%E3%83%88%E3%83%95%E3%82%A9%E3%83%AA%E3%82%AA?node-id=0%3A1)
<br>[カスタマージャーニーマップ](https://docs.google.com/spreadsheets/d/1GzpPlzdImhLdQxsnRQElXNBPGJt_X86fwO713I8Jfdo/edit?usp=sharing)

## 10/17スケジューリング&実績

1. 企画(アイデア企画・技術調査)：10/16
2. 設計(README、画面遷移図、ER 図の作成)：10/23 〆切 →10/22実施
3. メイン機能実装：11/20 〆切
4. MVP リリース：11/20 →11/22実施
5. 本番リリース：11 月末
