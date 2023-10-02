# README
--------------------
ユーザー情報テーブル
  has_many :商品情報テーブル
  belongs_to :発送先情報テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | text   | null: false, unique: true |
| email              | string | null: false               |
| encrypted_password | string | null: false               |
| name1              | string | null: false               |
| name2              | string | null: false               |
| birthday yymmdd    | string | null: false               |


--------------------
商品情報テーブル
  belongs_to :ユーザー情報テーブル
  belongs_to :購入記録

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| nickname   | text       | null: false, foreign_key: true |
| Item image | string     | null: false                    |
| item name  | text       | null: false                    |
| description| text       | null: false                    |
| detail     | text       | null: false                    |
| send       | text       | null: false                    |
| price      | text       | null: false                    |
| value      | text       | null: false                    |
| comment    | references | null: false                    |


--------------------
購入記録テーブル
  has_many :商品情報テーブル
  belongs_to :発送先情報テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| nickname | text       | null: false, foreign_key: true |
| day      | string     | null: false                    |
| time     | string     | null: false                    |
| item name| text       | null: false                    |


--------------------
発送先情報テーブル
  has_many :ユーザー情報テーブル
  has_many :購入記録テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| nickname | text       | null: false, foreign_key: true |
| address  | text       | null: false                    |
| day      | text       | null: false                    |