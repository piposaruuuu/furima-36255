# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| name               | string | null: false |
| kana_name          | string | null: false |
| birthday           | integer| null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| product_name  | string     | null: false                   |
| category      | string     | null: false                   |
| price         | integer    | null: false                   |
| listing_person| string     | null: false                   |
| condition     | integer    | null: false                   |
| text          | text       | null: false                   |
| user          | references | null: false, foreign_key: true|

### Association

- has_one :purchase
- belongs_to :user


## purchases テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| purchaser   | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- has_one :delivery 
- belongs_to :user
- belongs_to :item

## deliveries テーブル

| Column        | Type       | Options                      |
| ------------- | ---------- | ---------------------------- |
| shipping_fee  | string     | null: false                  |
| days          | string     | null: false                  |
| postal_code   | integer    | null: false                  |
| prefecture    | string     | null: false                  |
| city          | string     | null: false                  |
| block         | string     | null: false                  |
| building_name | string     |                              |
| phone_number  | integer    | null: false                  |


### Association

- belongs_to :purchase
