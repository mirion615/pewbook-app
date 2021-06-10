# Pewbook概要
 
プログラミング英語専用の英単語確認アプリです。  
主に3つの機能があります。
1. 3択クイズ
1. 辞書機能
1. 自分で問題を登録してアウトプット

## アプリURL

https://pewbook-app.herokuapp.com/

〈Basic認証〉  
username: katsu  
password: 6150
 
## DEMO
[]() 
３択クイズの様子です。  
**プログラミング英語に特化した英語クイズ**となっています。

[]()
登録されている英単語を検索できるので、辞書としても使えます。  
**プログラミングに適した日本語訳や、用語の解説**も確認できます。

[]()
自分で英単語や解説を登録できるので、**学習のアウトプット用**としても使えます。
 
## 特徴

Pewbookの対象は「**プログラミングの勉強を始めたけど、英語に苦手意識がある方**」です。

プログラミングには英語が必須です。  
具体的には以下のような状況で必須となります。
1. コードを書く時
1. エラーを確認する時
1. 解決法や機能実装方法を模索したけど、日本語のWebページには無さそうな時

要するに、必ず英語が付き纏います。  
「うわ…結構英語使うじゃん…」と思った方のために「Pewbook」を作りました。  
Pewbookはプログラミングでよく使われる英単語を非常に効率良く確認することができます。

## 制作背景

私がプログラミングを始めた時、一緒に勉強をしていた仲間が「marginとpaddingって良く間違える」「newとcreateって似たような意味じゃないの？」とよく英単語についてぼやいていました。私は元英語教員の力を発揮して、英単語のイメージやプログラミングに適した日本語訳を教えると「そういうことか！」と納得していました。  

 プログラミング英語は、いわゆる"普通の訳"では意味が腑に落ちないことが多々あります。その度にネットで調べたり、理解できないまま学習を進めていては効率が悪いです。　　
 「でも英単語学習に時間を割きたくない」　　
 それも分かります。  

そこでこのPewbookです。　　
ここに登録された英単語の訳は「プログラミング特有の日本語訳」です。プログラミングに良く使われる英単語と適した日本語訳がここに詰まっています。  
ぜひPewbookを通して皆さんの学習効率化に役立ていただいたら幸いです。


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
- has_many: rankings


## quizzesテーブル
| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| category_id        | integer    | null: false       |
| question           | string     | null: false       |
| correct            | string     | null: false       |
| incorrect1         | string     | null: false       |
| incorrect2         | string     | null: false       |
| answer_description | string     | null: false       |
| user_id            | references | foreign_key: true |


### Association
- belongs_to: user


## rankingsテーブル
| Column                       | Type       | Options           |
| ---------------------------- | ---------- | ----------------- |
| percentage_correct_answer    | integer    | null: false       |
| user_id                      | references | foreign_key: true |

### Association
- belongs_to: user
