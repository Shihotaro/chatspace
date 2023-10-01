# みんなの広場

不妊治療に関わる交流サイトです。  
人には相談しづらいこと、話しづらいこと、なんでも言える場所です。  
簡易登録で体調管理ツールとしても利用できます。  
<br>
* 不妊治療に関わるQ&Aページ
<img src="https://github.com/Shihotaro/chatspace/assets/123743578/e7e723c3-d3a3-48bd-8ab5-184113e4ae7a" width="1000">

* 体調管理ページ
<img src="https://github.com/Shihotaro/chatspace/assets/123743578/4f2b15f2-09a3-4340-95f5-c6b0d4d20b73" width="1000">

## 作成背景

近年、不妊に悩む人が増加している一方、不妊に関わる交流サイトが少ないと感じました。  
友達や家族、周りの人に聞きづらいことや話しづらいことも同じ悩みを持つ人達と交流することで、少しでも不安や悩みが解決できるよう作成しました。  
またこのサイトを通して、妊活を考える前の方にも不妊治療について知るきっかけになればと思います。  

## サンプルログイン

サイト画面、右上の「ゲストログイン」をご利用ください。

## 使用技術

* Ruby '2.7.7'
* Ruby on Rails '~> 7.0.6'
* Javascript
* Sqlite3 '~> 1.4'
* AWS
    * AWS CLI
    * ECR
    * ECS
* Docker
* GitHub Actions
* Rubocop
* Bootstrap '~> 5.0.2'
* chartkick
* Rspec '~> 6.0.0'
* Weather API

## アプリケーション全体図

<img src="https://github.com/Shihotaro/chatspace/assets/123743578/2e339d48-74f3-496c-9f1d-7b020e1e5a97" width="1000">

## 機能一覧

* ユーザー登録・編集機能
* ログイン機能
* Q&A投稿機能
   * 質問のお気に入り登録
   * タグ機能
   * 質問の検索
* 体調管理
  * 新規投稿 
  * 投稿編集
  * 投稿削除
  * データのグラフ表示 (chartkick)
* 天気予報

## LICENCE
OpenWeather
https://openweathermap.org/
