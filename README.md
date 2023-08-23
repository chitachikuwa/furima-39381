#テーブル設計

## users テーブル

| Column              | Type    | Option      |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| kana_last_name      | string  | null: false |
| kana_first_name     | string  | null: false |
| birth               | date    | null: false |

### Association
- has_many :items
- has_many :record
- has_one :costomer


## items テーブル

| Column           | Type                | Option                        |
| ---------------- | ------------------- | ----------------------------- |
| item_name        | string              | null: false                   |
| description      | text                | null: false                   |
| category_id      | integer             | null: false                   |
| condition_id     | integer             | null: false                   |
| shipping_fee_id  | integer             | null: false                   |
| shipping_area_id | integer             | null: false                   |
| shipping_day_id  | integer             | null: false                   |
| price            | integer             | null: false                   |
| user             | references          | null: false, foreign_key:true |

### Association
- belongs_to :user
- has_one :costomer
- has_one :record


## costomers テーブル

| Column            | Type       | Option                        |
| ----------------- | ---------- | ----------------------------- |
| postal_code       | integer    | null: false                   |
| shipping_area_id  | integer    | null: false                   |
| city              | string     | null: false                   |
| address           | string     | null: false                   |
| building          | string     |                               |
| phone_num         | string     | null: false                   |
| purchases         | references | null: false, foreign_key:true |
 

### Association
- belongs_to :user
- belongs_to :items
- belongs_to :record


## purchases テーブル

| Column    | Type       | Option                        |
| --------- | -----------| ----------------------------- |
| item      | references | null: false, foreign_key:true |
| user      | references | null: false, foreign_key:true |



### Association
- belongs_to :user
- belongs_to :items
- has_one :costomer