# README

# テーブル設計

## usersテーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ------------|
| nickname            | string | null: false |
| family_name         | string | null: false |
| first_name          | string | null: false |
| read_family         | string | null: false |
| read_first          | string | null: false |
| birth_date          | date   | null: false |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | -------------------------------|
| item_name           | string     | null: false                    |
| explanation         | text       | null: false                    |
| category            | integer    | null: false                    |
| content             | integer    | null: false                    |
| deliver_charge      | integer    | null: false                    |
| deliver_day         | integer    | null: false                    |
| ship_from_address   | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one    :purchases
- belongs_to_active_hash :category
- belongs_to_active_hash :content
- belongs_to_active_hash :deliver_charge
- belongs_to_active_hash :deliver_day
- belongs_to_active_hash :ship_from_address

## purchasesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------  | -------------------------------|
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| address          | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- has_one    :addresses

## addressesテーブル

| Column           | Type       | Options     |
| ---------------- | ---------  | ------------|
| postal_code      | string     | null: false |
| prefecture       | integer    | null: false |
| city             | string     | null: false |
| house_number     | string     | null: false |
| building_name    | string     | null: false |
| phone_number     | string     | null: false |

### Association
- belongs_to :purchases
- belongs_to_active_hash :prefecture