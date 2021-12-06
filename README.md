# アプリケーション名
## VENSEE
(読み方: べんしー)
自動販売機の英訳vending machineと、探す、求めるという意味のseekを組み合わせてこのアプリ名にしました。

# アプリケーション概要
全国に多数存在する色々な自動販売機の設置場所をユーザーが投稿、また検索機能を用いて自販機がどこにあるのか調べる事が出来るアプリケーションです。

# デプロイ先　
・URL : https://www.vensee-app.com/

# テスト用アカウント
アカウント①

・email : hoge@hoge

・password : 123abc

アカウント②

・email : hoge2@hoge

・password : abc123

# なぜこのアプリを作成しようと思ったか

前職では自動販売機に携わる仕事をしていました。

在職中新入社員が入社した際、いざ設置してある自販機の場所まで行ってもらおうとすると、紙に書いて説明や運転中に電話で上司や同僚に場所の確認を取りながら向かうなどかなり非効率、また危険を伴っていました。

そこで、こんなアプリがあれば一目でどこにあるのかが分かり、かなり業務効率も向上するのではないかと思い開発しました。

また、最近レトロ自販機や1000円自販機などのレアな自販機が注目されているのを知り、そういえば自販機の場所が分かるアプリがないなと思ったのもきっかけの一つでした。

# 利用方法

## トップページ

![giphy](https://user-images.githubusercontent.com/87076111/144804765-4a4c061f-0c93-4ad8-ab46-260ee5f6f73a.gif)

## 詳細ページ

Googleマップを導入し、詳しい場所を表示させました。

![6b94da6ec900d2f5f7d1839cb618d316](https://user-images.githubusercontent.com/87076111/144805896-3bc7bb7a-60ff-4ffc-b50d-2d28789409db.gif)

## 投稿ページ

入力された住所をもとに緯度経度カラムに情報を保存し、それをもとに自動でGoogleマップ上にピン留めを行い、詳細ページで確認できるようにしました。

![giphy (2)](https://user-images.githubusercontent.com/87076111/144806652-75120974-cd84-4eab-acab-112a7dc53dc4.gif)

# 工夫したポイント

## SSL化
セキュリティを強化するためにSSL化を行いました。

また、SSL化することにより次世代プロトコルである「HTTP/2」を利用できるようになり、通信の効率化によってWebサイトの表示を高速化し、現在主流である「HTTP/1.1」より速くWebサイトを表示することができる為こちらを導入しました。

## どこでも検索できる
どのページを閲覧している場合でもすぐに検索できるように、ヘッダー部分に検索フォームを配置しました。
また、都道府県名とは別にジャンル別でも検索できるようになっています。

## 詳細表示機能
緯度軽度カラムに保存された情報をもとに、詳細ページのGoogleマップ上に自動で反映させるようにしました。
Googleマップがある事で住所情報だけでは分からない詳細な場所が分かるようになっています。

# 実装予定の機能、課題

・住所入力ではなく、ユーザーの位置情報をもとに住所を自動入力

・スマホからでも投稿、閲覧できるようにレスポンシブ対応

・可能であれば、既存である全ての自販機の位置情報等が情報としてあるAPIの取得

・そのAPIの情報をもとに、トップページにもGoogleマップを表示し位置情報を反映させる
# 開発環境
・フロントエンド: html/css(tailwind)/JavaScript

・バックエンド:Ruby on Rails(6.0.0)/Ruby(2.6.5)/JavaScript

・テスト: RSpec

・Linter: Rubocop

・データベース: MySQL(5.6.51)/Sequel Pro

・インフラ: EC2
# テーブル設計

## users テーブル(ユーザー情報)

| Column        | Type    | Option
|---------------|---------|---------------
| nickname      | string  | null: false
| email         | string  | null: false, unique: true
| password      | string  | null: false

### association
- has_many :venders
- has_many :comments

## venders テーブル(自販機情報)

| Column       | Type       |  Option
|--------------|------------|-----------
| user         | references | null: false,foreign_key: true
| title        | string     | null: false
| genre_id     | integer    | null: false
| introduction | text       | 
| residence    | text       | null: false
| latitude     | float      | 
| longitude    | float      | 
### association
- belongs_to :user
- has_many :comments
- has_one_attached :image

## comments テーブル(コメント情報)

| Column |  Type      |  Option 
|--------|------------|-------------------------------
| user   | references | null: false, foreign_key: true
| text   | text       | 

### association
- belongs_to :user
- belongs_to :vender