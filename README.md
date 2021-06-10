## usersテーブル
| column             | type     | option                   |
| ------------------ | -------- | ------------------------ |
| nickname           | string   | null: false              |
| email              | string   | null: false unique :true |
| encrypted_password | string   | null: false              |
| family_name        | string   | null: false              |
| first_name         | string   | null: false              |
| family_read        | string   | null: false              |
| first_read         | string   | null: false              |
| birthday           | date     | null: false              |

## Association
* has_many :items
* has_many :comments
* has_many :purchases

## itemsテーブル
| -------------- | ----------- | ------------------ |
| title          |  string     | null: false        |
| concept        |  text       | null: false        |
| category_id    |  integer    | null: false        |
| condition_id   |  integer    | null: false        |
| burden_id      |  integer    | null: false        |
| prefecture_id  |  integer    | null: false        |
| area_id        |  integer    | null: false        |
| days_id        |  integer    | null: false        |
| user           |  references | foreign_key:true   |

## Association
* belongs_to :user
* has_many :comments
* has_one :purchase
* belongs_to_active_hash :category
* belongs_to_active_hash :condition
* belongs_to_active_hash :burden
* belongs_to_active_hash :area
* belongs_to_active_hash :days
* belongs_to_active_hash :prefectures


## commentsテーブル
| ----
| user    | integer | null: false |
| content | string  | null: false |
| buyers  | integer | null: false |

* belongs_to :user
* belongs_to :item

## purchaseテーブル
| -------------- | ---------- | ----------------- |
| item_id        | integer    | foreign_key: true |
| user_id        | integer    | foreign_key: true |

* belongs_to :item
* belongs_to :user
* has_one :buyer

## buyersテーブル
| --------------- | ---------- | ----------------- |
| post_code       | text       | null: false       |
| prefectures     | references | foreign_key: true |
| city            | string     | null: false       |
| address         | string     | null: false       |
| building_number | string     |                   |
| phone_number    | string     | null: false       |
| purchase_id     | integer    | foreign_key: true |

* belongs_to :purchase
* belongs_to :user