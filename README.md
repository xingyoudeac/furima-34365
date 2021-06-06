## userテーブル
| column             | type     | option                   |
| ------------------ | -------- | ------------------------ |
| nickname           | string   | null: false              |
| email              | string   | null: false unique :true |
| encrypted_password | string   | null: false              |
| family_name        | string   | null: false              |
| first_name         | string   | null: false              |
| family_read        | string   | null: false              |
| first_read         | string   | null: false              |
| birthday           | string   | null: false              |

## Association
* has_many :items
* has_many :comments
* has_many :purchases

## itemsテーブル
| --------- | -------- | ------------ |
| title     |  string  | null: false  |
| concept   |  text    | null: false  |
| category  |  string  | null: false  |
| condition |  string  | null: false  |
| price     |  string  | null: false  |
| burden    |  string  | null: false  |
| area      |  string  | null: false  |
| date      |  string  | null: false  |

## Association
* belongs_to :user
* has_many :comments
* has_one :purchase

## purchaseテーブル
| --------- | ---------- | ----------------- |
| residence | references | foreign_key: true |
| user      | references | foreign_key: true |

* belongs_to :item
* belongs_to :user

## commentsテーブル
| -------- | ---------- | ----------------- |
| text     | text       | null: false       |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |
| address  | string     | null: false       |

* belongs_to :item
* belongs_to :user