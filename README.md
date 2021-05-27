## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |˜
| encrypted_password | string | null: false               |

### Association
- has_many: quizzes
- has_many: answer_histories


## titlesテーブル
| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| title              | string     | null: false       |
| description        | string     | null: false       |
| quiz_id            | references | foreign_key: true |

### Association
- has_one: quiz


## quizzesテーブル
| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| question            | string     | null: false       |
| correct            | string     | null: false       |
| incorrect1         | string     | null: false       |
| incorrect2         | string     | null: false       |
| answer             | integer    | null: false       |
| description        | string     |
| title_id           | references | foreign_key: true |
| user_id            | references | foreign_key: true |
| category_id        | references | foreign_key: true |

### Association
- belongs_to: user
- belongs_to: category
- belongs_to : title
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