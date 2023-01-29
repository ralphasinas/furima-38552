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

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |


### Association

- has_many :items dependent: :destroy
- has_many :orders dependent: :destroy


## items テーブル

| Column           | Type      | Options                        |
| ------           | --------- | -----------                    |
| name             | string    | null: false                    |
| detail           | text      | null: false                    |
| category_id      | reference | null: false, foreign_key: true |
| condition_id     | reference | null: false, foreign_key: true |
| shipping_fee_id  | reference | null: false, foreign_key: true |
| shipping_area_id | reference | null: false, foreign_key: true |
| shipping_day_id  | reference | null: false, foreign_key: true |
| price            | integer   | null: false                    |
| user_id          | string    | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order

## address テーブル

| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| shipping_area_id | reference  | null: false |
| city             | reference  | null: false |
| street           | reference  | null: false |
| building_name    | reference  | null: true, |
| phone_number     | reference  | null: false |
| order_id         | string     | null: false, foreign_key: true |


### Association

- belongs_to :order

## orders テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| item_id       | string     | null: false, foreign_key: true |
| user_id       | string     | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address