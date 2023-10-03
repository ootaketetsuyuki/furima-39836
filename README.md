# README
--------------------
users
  has_many :items
  has_many :send

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
  belongs_to :Purchase_history

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| nickname   | string     | null: false                    |
| item_name  | string     | null: false                    |
| description| text       | null: false                    |
| category   | string     | null: false                    |
| situation  | string     | null: false                    |
| send       | string     | null: false                    |
| address    | text       | null: false                    |
| day        | text       | null: false                    |
| price      | integer    | null: false                    |


--------------------
Purchase_history
  belongs_to :send

| Column         | Type       | Options                        |
| --------       | ---------- | ------------------------------ |
| card           | integer    | null: false                    |
| date_of_expiry | integer    | null: false                    |
| security_code  | integer    | null: false                    |
| post_code      | integer    | null: false                    |
| state_name     | string     | null: false                    |
| city_name      | string     | null: false                    |
| street_address | string     | null: false                    |
| building       | string     | null: false                    |
| phone_number   | integer    | null: false                    |


--------------------
sends
  has_many :users
  has_many :Purchase_history

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| nickname | string     | null: false, foreign_key: true |
| address  | text       | null: false                    |
| day      | text       | null: false                    |
| email    | string     | null: false, foreign_key: true |