## userテーブル
| column       | type     | option       |
| ------------ | -------- | ------------ |
| nickname     | string   | null: false  |
| email        | string   | null: false  |
| password     | string   | null: false  |
| name         | string   | null: false  |

## Association
* has_many :items
* has_many :comments

## itemテーブル
| -------- | -------- | ------------ |
| title    |  string  | null: false  |
| concept  |  text    | null: false  |
| detail   |  string  | null: false  |
| send     |  string  | null: false  |
| price    |  string  | null: false  |

## Association
* belongs_to :user
* has_many :comments

## commentsテーブル
| -------- | ---------- | ----------------- |
| text     | text       | null: false       |
| comment  | references | foreign_key: true |
| user     | references | foreign_key: true |

* belongs_to :items
* belongs_to :user