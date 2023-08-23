#テーブル設計

## users テーブル

| Column              | Type    | Option      |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| encrypted_password  | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| kana_last_name      | string  | null: false |
| kana_first_name     | string  | null: false |
| birth_year          | integer | null: false |
| birth_month         | integer | null: false |
| birth_day           | integer | null: false |

### Association
- has_many :items
- has_many :record
- has_one :costomer


## items テーブル

| Column        | Type                | Option                        |
| ------------- | ------------------- | ----------------------------- |
| image_url     | varchar             | null: false                   |
| item_name     | string              | null: false                   |
| description   | text                | null: false                   |
| category      | enum                | null: false                   |
| condition     | enum                | null: false                   |
| shipping_fee  | enum                | null: false                   |
| shipping_area | enum                | null: false                   |
| shipping_days | enum                | null: false                   |
| price         | integer             | null: false                   |
| seller_id     | references(user_id) | null: false, foreign_key:true |

### Association
- belongs_to :user
- has_one :costomer
- has_one :record


## costomers テーブル

| Column      | Type       | Option                        |
| ----------- | ---------- | ----------------------------- |
| postal_code | integer    | null: false                   |
| prefecture  | enum       | null: false                   |
| city        | string     | null: false                   |
| address     | string     | null: false                   |
| building    | string     |                               |
| phone_num   | integer    | null: false                   |
| user        | references | null: false, foreign_key:true |
 

### Association
- belongs_to :user
- belongs_to :items
- belongs_to :record


## records テーブル

| Column    | Type                |                               |
| --------- | ------------------- | ----------------------------- |
| item      | references          | null: false, foreign_key:true |
| buyer_id  | references(user_id) | null: false, foreign_key:true |
| seller_id | references(user_id) | null: false, foreign_key:true |


### Association
- belongs_to :user
- belongs_to :items
- has_one :costomer