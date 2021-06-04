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
* has_many :purchase

## itemsテーブル
| -------- | -------- | ------------ |
| title    |  string  | null: false  |
| concept  |  text    | null: false  |
| detail   |  string  | null: false  |
| price    |  string  | null: false  |

## Association
* belongs_to :user
* has_many :comments
* has_one :purchase

## purchaseテーブル
| --------- | --------- | ----------------- |
| residence | string    | null: false       |
| user.id   | reference | foreign_key: true |

* belongs_to :items
* belongs_to :users

## commentsテーブル
| -------- | ---------- | ----------------- |
| text     | text       | null: false       |
| user.id  | references | foreign_key: true |

* belongs_to :items
* belongs_to :user