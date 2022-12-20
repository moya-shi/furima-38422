# テーブル設計

## users テーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |
| birthday_year   | string | null: false               |
| birthday_month  | string | null: false               |
| birthday_day    | string | null: false               |

### Association

- has_many :purchases
- has_many :items

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | string     | null: false                    |
| name             | string     | null: false                    |
| explanation      | text       | null: false                    |
| category         | string     | null: false                    |
| condition        | string     | null: false                    |
| shipping_cost    | string     | null: false                    |
| shipping_address | string     | null: false                    |
| shipping_days    | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_information

## shipping_information テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| postcode     | string |             |
| prefectures  | string | null: false |
| municipality | string | null: false |
| address      | string | null: false |
| building     | string | null: false |
| phone_number | string | null: false |

### Association

- belongs_to :purchase