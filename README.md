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
- has_many :buyer



## buyers テーブル

| Column             | Type    | Options                        |
| ------------------ | --------| -------------------------------|
| item_id            | integer | null: false, foreign_key: true |
| user_id            | integer | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :region
- has_may :items



## regionsテーブル
| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| post_code          | string  | null: false                    |
| prefecture_id      | integer | null: false                    |
| city               | string  | null: false                    |
| address_number     | string  | null: false                    |
| building_name      | string  |                                |
| phon_number        | string  | null: false                    |

### Association

- belongs_to :buyer

##  itemsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| title          | string     | null: false                    |
| description    | text       | null: false                    |
| category_id    | integer    | null: false                    |
| status_id      | integer    | null: false                    |
| buy_cost_id    | integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |
| buy_day_id     | integer    | null: false                    |
| sale           | integer    | null: false                    |
| user           | references | null: false,foreign_key: true  |


### Association
- belongs_to :user 
- belongs_to :buyer

