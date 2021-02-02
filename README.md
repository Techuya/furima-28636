# テーブル設計

## users テーブル

| Column             | Type   | Options                         |
| ------------------ | ------ | ------------------------------- |
| nickname           | string | null: false                     |
| email              | string | null: false, uniqueness: true   |
| encrypted_password | string | null: false                     |
| last_name          | string | null: false                     |
| first_name         | string | null: false                     |
| last_name_kana     | string | null: false                     |
| first_name_kana    | string | null: false                     |
| birthday           | date   | null: false                     |

### Association

- has many :items
- has many :purchases

## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| description          | text       | null: false                    |
| category_id          | integer    | null: false                    |
| product_condition_id | integer    | null: false                    |
| postage_payer_id     | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| arrival_day_id       | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has one :purchase

## order テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item              | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has one :address

## addresses テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| postal_code       | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| city              | string     | null: false                    |
| house_number      | string     | null: false                    |
| building          | string     |                                |
| phone_number      | string     | null: false, uniqueness: true  |
| order             | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase