# アプリケーション名 : MothersTweets
<br/>
	
# アプリケーション概要 :
  接続先情報<br/>
   https://tagtweet-mother.herokuapp.com/  

  ID/Pass  
  ID: admin  
  Pass: 9317  
  テスト用アカウント等  
  ユーザーA<br/> 
  メールアドレス: aa@a.com  
  パスワード: q1w2e3r4  
  ユーザーB<br/>
  メールアドレス名: aaa@aa.com<br/>
  パスワード: q1w2e3r4<br/>
  ユーザーC<br/>
  メールアドレス名: aaaa@aaa.com<br/>
  パスワード: q1w2e3r4<br/>
  
  Githubリポジトリ  
  https://github.com/pyontarou/tagtweet.git
 
<br/>
 
# 動作確認方法
WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。<br/>
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。<br/>
接続先およびログイン情報については、上記の通りです。<br/>
同時に複数の方がログインしている場合に、ログインできない可能性があります。<br/>
テストアカウントでログイン→トップページから商品検索→商品選択→商品購入 <br/>
確認後、ログアウト処理をお願いします。<br/>
 
<br/>

# 開発状況
  開発環境<br/>
  Ruby/Ruby on Rails/JavaScript/MySQL/Github/Visual Studio Code<br/>
  開発期間と平均作業時間<br/>
  開発期間：3/16~3/19(3日間）<br/>
  1日あたりの平均作業時間：10<br/>
  合計：30時間程度<br/>
  

<br/>

# 目指した課題解決
ペルソナ : 10~40代の子育てをしている女性。  
育児中心の生活になることで思い通りに時間が使えない、また、社会からの疎外感・孤立感が精神的負担となることの多い育児。
同じ境遇の気持ちを共有できる・吐露できる場を設けることで、精神的負担の緩和の一助となれるアプリを提供できたらと考え作成に至りました。
<br/>

<br/>

# 洗い出した要件
| 優先順位<br/>（高：3、中：2、低：1) | 機能            |  目的                                              | 詳細                                                                                                        | ストーリー(ユースケース)                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | 見積もり（所要時間） |
|-----------------------------------|-----------------|--------------------------------------------------|------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------|
| 3                               | ユーザー管理機能 | 顧客管理                                          | 新規登録を行うことでツイートの投稿・コメント・いいね、ができるようにする             | ・必要な情報を適切に入力すると、新規登録/ログインができる<br/>・新規登録・ログイン共にエラーハンドリングができていること（入力に問題がある状態で「会員登録」または「ログイン」ボタンが押された場合、情報は受け入れられず、各ページでエラーメッセージが表示されること）                   | 3                 |
| 3                                | ツイート機能      | ツイートを投稿する              | ツイートの投稿ができるようにする                                                        | ・新規登録済みでログインしていることが前提<br/>・ツイートは投稿の新しい順番に一覧に表示されるようにする<br/>・一覧表示は、新しい投稿順に30件とする                                | 3                 |
| 3                                | タグ付け機能    | ツイートにタグを付ける            | ツイートの投稿時にダグを付けられるようにする                 | ・新規登録済みでログインしていることが前提<br/>・ツイート投稿時にタグが付けられるようにする<br/>・文字の入力の都度、自動的に検索が行われる<br/> | 3                 |
| 3                                | コメント機能     | ツイートに対しコメントする |投稿済みの ツイートに対し、コメントができるようにする | ・新規登録済みでログインしていることが前提<br/>・ツイートに対しコメントができ、コメントの新しい順に表示される<br>                                           | 3                 |
| 2                                | いいね機能  | ツイートに対して「いいね」をする         | 投稿済みのツイートに対して、「いいね」ができるようにする                                                                  | ・新規登録済みでログインしていることが前提<br/>・ログインしているユーザーが１ユーザー１「いいね」ができる<br/>・「いいね」したかわかるように、「いいね」の有無でイメージ画像を変える<br/>                                                                                                                                                                                                       | 3                 |
| 2                               | ツイート検索機能 | ツイートの検索をする           | 投稿済みのツイートの投稿から、検索できるようにする                                                                                       | ・投稿検索入力欄に検索内容を入力することで、検索キーワードの含まれる内容のツイートを検索することができる。<br/>・検索結果は投稿日時の新たらしい順番に表示される                                                                                                                                                                                                                                                     | 2                 |
| 2                               | タグ検索機能 | タグの検索をする           | 投稿ずみのタグから、検索できるようにする                                                                                       | ・タグ検索入力欄に検索内容を入力することで、検索キーワードの含まれる内容のタグを検索することができる。<br/>・検索結果は投稿日時の新たらしい順番に表示されるる                              | 2                 |
| 2                               | ツイートの削除機能 | ツイートを削除できる           | 登録の変更投稿済みのツイートを削除できるようにするできるようにする                                                                                       | ・新規登録済みでログインしていることが前提<br/>・ツイートを投稿したログインユーザーのみ削除を行える<br/>・削除すると、ツイートに紐づくタグもコメントも削除される                  | 1                 |
| 2                               | ユーザーの詳細機能 | ユーザーのツイート一覧を表示する           | ユーザーが投稿済みのツイートを一覧で確認することができる                                                                                       | ・新規登録済みでログインしていることが前提<br/>・ログインユーザーが投稿したツイートのみ表示される<br/>    | 1                 |

<br/>
<br/>

# 実装内容
・タグ付け機能にインクリメンタルサーチを実装し入力しやすくしました。<br/>
  https://gyazo.com/d74a7fc05ee0e91d69492fde8c8e54be

・コメントを即時更新する機能を、Action Cableを用いて実装しました。<br/>
  https://gyazo.com/c678d1d6885952e72e4f47926e399819

・「いいね」機能は非同期で実装しました。また、「いいね」のクリック前後でイメージ画像が変わるようにし、わかりやすくしました。<br/>
  https://gyazo.com/faeadc2d5b2109917bf07172937a582b

・投稿済みのツイート・タグの両方から検索できるようにしました。<br/>
  https://gyazo.com/5bad314a57a57b6303514e26990dbfa0 <br/>
  https://gyazo.com/d7a6a738776ec7f1ec005423c32ceb22 <br/>

・レスポンシブ対応のWebサイトを作成しました。<br/>
  https://gyazo.com/b22fba34046b850e1075d0c607a74e30

・ユーザーが投稿したツイートを確認できる一覧表示を作成しました。<br/>
  https://gyazo.com/b3bdf9544033df74943aa711eded84aa

<br/>

# ER図
https://gyazo.com/f072c0d77b0fa72b65e5d0331d7bede7

<br/>

# テーブル設計

## users テーブル

| Column                | Type   | Options                  |
| --------------------- | ------ | ------------------------ |
| nickname              | string | null: false              |
| email                 | string | null: false, unique:true |
| encrypted_password    | string | null: false              |
| last_name             | string | null: false              |
| first_name            | string | null: false              |
| last_name_kana        | string | null: false              |
| first_name_kana       | string | null: false              |
| birth_day             | date   | null: false              |

### Association

- has_many :tweets
- has_many :comments
- has_many :likes, dependent: :destroy 
- has_many :like_tweets, through: :likes, source: :tweet

## tweets テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| message            | string     | null: false                    |


### Association

- has_many :tweet_tag_relations,dependent: :destroy
- has_many :tags, through: :tweet_tag_relations
- belongs_to :user
- has_many :comments,dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :users, through: :likes

## tags テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| name       | string | null: false|

### Association

-  has_many :tweet_tag_relations
-  has_many :tweets, through: :tweet_tag_relations


## tweet_tag_relations テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| tweet      | references | null: false, foreign_key: true |
| teg     | references | null: false, foreign_key: true |

### Association

- belongs_to :tweet
- belongs_to :tag

## comments テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| text      |text | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |
| tweet    | references | null: false, foreign_key: true |

### Association

- belongs_to :tweet
- belongs_to :user

## likes テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| tweet      | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :tweet
- belongs_to :user

