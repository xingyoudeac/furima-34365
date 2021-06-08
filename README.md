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
| birthday           | string   | null: false              |

## Association
* has_many :items
* has_many :comments
* has_many :purchases

## itemsテーブル
| ----------- | ----------- | ------------------ |
| photo       |  string     | nill: false        |
| title       |  string     | null: false        |
| concept     |  text       | null: false        |
| category    |  integer    | null: false        |
| condition   |  integer    | null: false        |
| burden      |  integer    | null: false        |
| area        |  integer    | null: false        |
| days        |  integer    | null: false        |
| prefectures |  integer    | null: false        |
| user        |  references | null: false        |

## Association
* belongs_to :user
* has_many :comments
* has_one :purchase
* belongs_to_active_hash :category
* belongs_to_active_hash :condition
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
| --------- | ---------- | ----------------- |
| purchase  | references | foreign_key: true |
| user      | references | foreign_key: true |

* belongs_to :item
* belongs_to :user
* belongs_to :purchase

## buyersテーブル
| --------------- | ---------- | ----------------- |
| post_code       | text       | null: false       |
| prefectures     | references | foreign_key: true |
| city            | string     | null: false       |
| address         | string     | null: false       |
| building_number | string     |                   |
| phone_number    | string     | null: false       |
| item_purchase   | integer    | foreign_key: true |

* has_one :purchase
* belongs_to :user