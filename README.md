# Pewbook
 
プログラミング英語専用の英単語確認アプリです。
主に3つの機能があります。
1. 3択クイズ
1. 辞書機能
1. 自分で問題を登録してアウトプット
 
# DEMO
[]() 
３択クイズの様子です。
プログラミング英語に特化した英語クイズとなっています。

[]()
登録されている英単語を検索できるので、辞書としても使えます。
プログラミングに適した日本語訳や、用語の解説も確認できます。

[]()
自分で英単語や解説を登録できるので、学習のアウトプット用としても使えます。
 
# Features

Pewbookの対象は「プログラミングの勉強を始めたけど、英語に苦手意識がある方」です。

プログラミングには英語が必須です。具体的には以下のような状況で必須となります。
1. コードを書く時
1. エラーを確認する時
1. 解決法や機能実装方法を模索したけど、日本語のWebページには無さそうな時

要するに、必ず英語が付き纏います。「うわ…結構英語使うじゃん…」と思った方のために「Pewbook」を作りました。Pewbookはプログラミングでよく使われる英単語を非常に効率良く確認することができます。

# 機能一覧

- ユーザー登録、ログイン機能(devise)
- ゲストログイン機能
- ユーザ編集機能
- Quiz機能
- Quiz一覧機能
- Quiz投稿機能
- 投稿編集機能
- 投稿削除機能
- My Quiz一覧機能
- インクリメンタルサーチ機能
- 画像プレビュー機能
- ユーザーランキング機能
- ページネーション機能

# 使用技術
 
- ruby 2.6.5
- rails 6.0.0
- vue 2.6.12
- mysql2 0.4.4
- webpacker 4.0
- element-ui 2.15.2
- chart.js 2.8
- vue-chartjs 3.4.2
- RSpec
- AWS
  - S3

# テスト
RSpec
単体テスト(model)
統合テスト(system)

# 今後の課題点

- ユーザーが使いやすいデザイン
- レスポンシブ対応
- Vuex, Vue Routerを使った完全SPA化
- Dockerの導入 
- CircleCIを使った自動テスト


## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |˜
| encrypted_password | string | null: false               |

### Association
- has_many: quizzes
- has_many: answer_histories


## quizzesテーブル
| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| title              | string     | null: false       |
| description        | string     | null: false       |
| question           | string     | null: false       |
| correct            | string     | null: false       |
| incorrect1         | string     | null: false       |
| incorrect2         | string     | null: false       |
| answer_description | string     |
| user_id            | references | foreign_key: true |
| category_id        | references | foreign_key: true |

### Association
- belongs_to: user
- belongs_to: category
- has_one : answer_history


## categories テーブル
| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| name               | string     | null: false       |

### Association
- has_many:quizzes 

## answer_historiesテーブル
| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| answer             | integer    | null: false       |
| user_id            | references | foreign_key: true |
| quiz_id            | references | foreign_key: true |

### Association
- belongs_to: user
- belongs_to: quiz
- has_one : answer_history