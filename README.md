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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_date         | date   | null: false |


### Association

- has_many :items dependent: :destroy
- has_many :orders dependent: :destroy

## items テーブル

| Column         | Type      | Options                        |
| ------         | --------- | -----------                    |
| name           | string    | null: false                    |
| detail         | text      | null: false                    |
| category_id    | reference | null: false, foreign_key: true |
| condition_id   | reference | null: false, foreign_key: true |
| shipping_fee   | reference | null: false, foreign_key: true |
| shipping_area  | reference | null: false, foreign_key: true |
| shipping_days  | reference | null: false, foreign_key: true |
| price          | integer   | null: false                    |

### Association

- belongs_to :user
- belongs_to :order

## orders テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture_id | references | null: false, foreign_key: true |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |


### Association

- belongs_to :user

