# README
--------------------
users
  has_many :items
  has_many :orders

| Column             | Type   | Options                        |
| ------------------ | ------ | -----------                    |
| nickname           | string | null: false                    |
| email              | string | null: false, foreign_key: true |
| encrypted_password | string | null: false                    |
| first_name         | string | null: false                    |
| last_name          | string | null: false                    |
| first_name2        | string | null: false                    |
| last_name2         | string | null: false                    |
| birthday           | date   | null: false                    |


--------------------
items
  belongs_to :user
  has_one :purchase_history

| Column        | Type       | Options                        |
| ----------    | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item_name     | string     | null: false                    |
| description   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| situation_id  | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| address_id    | integer    | null: false                    |
| day_id        | integer    | null: false                    |
| price         | integer    | null: false                    |


--------------------
purchase_histories
  belongs_to :order

| Column         | Type       | Options                        |
| --------       | ---------- | ------------------------------ |
| order           | references | null: false, foreign_key: true |
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city_name      | string     | null: false                    |
| street_address | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |


--------------------
orders
- belongs_to :item
- belongs_to :user
- has_one :purchase_history

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |