# テーブル設計

## users テーブル

| Column     | Type   | Options                       |
| ---------- | ------ | ----------------------------- |
| nickname   | string | null: false                   |
| email      | string | null: false, uniqueness: true |
| password   | string | null: false, uniqueness: true |
| last_name  | string | null: false                   |
| first_name | string | null: false                   |
| birthday   | date   | null: false                   |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| image             | string     | null: false                    |
| name              | string     | null: false                    |
| description       | text       | null: false                    |
| category          | string     | null: false                    |
| product_condition | string     | null: false                    |
| postage_payer     | string     | null: false                    |
| prefecture        | string     | null: false                    |
| arrival_day       | string     | null: false                    |
| price             | string     | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase

## purchases テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| card_number       | string     | null: false                    |
| expiration        | string     | null: false                    |
| security_code     | string     | null: false                    |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column            | Type    | Options                       |
| ----------------- | ------- | ----------------------------- |
| postal_code       | string  | null: false                   |
| prefecture        | string  | null: false                   |
| city              | string  | null: false                   |
| house_number      | string  | null: false                   |
| building          | string  | null: false                   |
| phone_number      | string  | null: false, uniqueness: true |

### Association

- belongs_to :purchase