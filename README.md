# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

--------------------
usersテーブル
  has_many :商品テーブル
  has_many :買い手

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| address            | text   | null: false               |
| phonenummber       | text   | null: false               |
| birthday yymmdd    | text   | null: false               |


--------------------
Itemsテーブル
  belongs_to :user
  has_many :買い手テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| category   | string     | null: false                    |
| price      | text       | null: false                    |
| day        | text       | null: false                    |
| value      | text       | null: false                    |
| user       | references | null: false, foreign_key: true |


--------------------
発送先テーブル
  belongs_to :user
  belongs_to :商品テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| content  | text       | null: false                    |
| prototype| references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |
| send     | text       | null: false                    |