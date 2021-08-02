# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------------------  |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| product_name    | string     | null: false                   |
| text            | text       | null: false                   |
| price           | integer    | null: false                   |
| category_id     | integer    | null: false                   |
| condition_id    | integer    | null: false                   |
| shipping_fee_id | integer    | null: false                   |
| prefecture_id   | integer    | null: false                   |
| shipping_day_id | integer    | null: false                   |
| user            | references | null: false, foreign_key: true|

### Association

- has_one :purchase
- belongs_to :user


## purchases テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- has_one :delivery 
- belongs_to :user
- belongs_to :item

## deliveries テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| postal_code   | string     | null: false                   |
| city          | string     | null: false                   |
| block         | string     | null: false                   |
| building_name | string     |                               |
| phone_number  | string     | null: false                   |
| purchase      | references | null: false, foreign_key: true|
| prefecture_id | integer    | null: false                   |


### Association

- belongs_to :purchase
