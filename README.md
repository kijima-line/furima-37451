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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| fist_name          | string | null: false |
| fist_name_a        | string | null: false |
| last_name_b        | string | null: false |
| information        | text   | null: false |
| birthday           | date   | null: false |



### Association
- has_many :items dependent: :destroy
- belongs_to :settlement dependent: :destroy
- belongs_to :card dependent: :destroy


## settlement テーブル

| Column             | Type    | Options                        |
| ------------------ | --------| -------------------------------|
| last_name          | string  | null: false                    |
| fist_name          | string  | null: false                    |
| fist_name_a        | string  | null: false                    |
| last_name_b        | string  | null: false                    |
| prefecture         | string  | null: false                    |
| city               | string  | null: false                    |
| address            | string  | null: false                    |
| bill_name          | string  | null: false                    |
| phon_number        | string  | null: false                    |
| user_id            | integer | null: false, foreign_key: true |



### Association

- belongs_to :user



##  itemテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| title          | string     | null: false                    |
| description    | string     | null: false                    |
| sale           | string     | null: false                    |
| status         | string     | null: false                    |
| buy_days       | string     | null: false                    |
| buy_cost       | string     | null: false                    |
| prefecture_id  | string     | null: false                    |
| buy_id         | integer    | null: false,foreign_key: true  |
| category_id    | integer    | null: false,foreign_key: true  |
| brand_id       | integer    | null: false,foreign_key: true  |
| user_id        | integer    | null: false,foreign_key: true  |



### Association
- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy   
- belongs_to :brand dependent: :destroy

- has_many   :images dependent: :destroy

- belongs_to_active_hash :prefecture

##  imageテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| prefecture_id  | string     | null: false                    |
| item_id        | integer    | null: false,foreign_key: true  |

### Association

- belongs_to :item

##  brandテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | index: true                    |


### Association

- belongs_to :items

##  cardテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | integer    | null: false,foreign_key: true  |
| card_id        | string     | null: false                    |


### Association

- belongs_to :user
