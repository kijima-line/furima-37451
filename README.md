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

# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| fist_name          | string | null: false              |
| fist_name_kana     | string | null: false              |
| last_name_kana     | string | null: false              |
| birth_day          | date   | null: false              |




### Association
- has_many :items
- belongs_to :settlement dependent: :destroy



## settlement テーブル

| Column             | Type    | Options                        |
| ------------------ | --------| -------------------------------|
| last_name          | string  | null: false                    |
| fist_name          | string  | null: false                    |
| fist_name_a        | string  | null: false                    |
| last_name_b        | string  | null: false                    |
| phon_number        | string  | null: false                    |
| user_id            | integer | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :address


## addressテーブル
| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| prefecture         | string  | null: false                    |
| city               | string  | null: false                    |
| address_number     | string  | null: false                    |
| bill_name          | string  | null: false                    |

### Association

- belongs_to :settlement

##  itemsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| title          | string     | null: false                    |
| description    | string     | null: false                    |
| sale           | string     | null: false                    |
| status         | string     | null: false                    |
| buy_cost       | string     | null: false                    |
| buy_day        | string     | null: false                    |
| prefecture_id  | string     | null: false                    |
| category_id    | integer    | null: false,foreign_key: true  |
| user_id        | integer    | null: false,foreign_key: true  |


### Association
- belongs_to :user 


