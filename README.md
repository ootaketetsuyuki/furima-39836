# README
--------------------
users
  has_many :items
  belongs_to :send

| Column             | Type   | Options                        |
| ------------------ | ------ | -----------                    |
| nickname           | string | null: false                    |
| email              | string | null: false, foreign_key: true |
| encrypted_password | string | null: false                    |
| name1              | string | null: false                    |
| name2              | string | null: false                    |
| birthday           | date   | null: false                    |


--------------------
items
  belongs_to :user
  belongs_to :buyrecord

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| nickname   | string     | null: false                    |
| Item_image | string     | null: false                    |
| item_name  | string     | null: false                    |
| description| string     | null: false                    |
| category   | string     | null: false                    |
| situation  | string     | null: false                    |
| send       | string     | null: false                    |
| address    | text       | null: false                    |
| day        | text       | null: false                    |
| price      | string     | null: false                    |
| value      | string     | null: false                    |
| comment    | references | null: false                    |
| email      | string     | null: false, foreign_key: true |


--------------------
buyrecord
  has_many :items
  belongs_to :send

| Column    | Type       | Options                        |
| --------  | ---------- | ------------------------------ |
| nickname  | string     | null: false                    |
| Item_image| string     | null: false                    |
| item_name | string     | null: false                    |
| day       | string     | null: false                    |
| time      | string     | null: false                    |
| item_name | text       | null: false                    |
| email     | string     | null: false, foreign_key: true |


--------------------
sends
  has_many :users
  has_many :buyrecords

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| nickname | string     | null: false                    |
| address  | text       | null: false                    |
| day      | text       | null: false                    |
| email    | string     | null: false, foreign_key: true |