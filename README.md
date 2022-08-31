# README

# テーブル設計

## usersテーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | --------------------------|
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| family_name         | string | null: false               |
| first_name          | string | null: false               |
| read_family         | string | null: false               |
| read_first          | string | null: false               |
| birth_date          | date   | null: false               |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| item_name             | string     | null: false                    |
| explanation           | text       | null: false                    |
| category_id           | integer    | null: false                    |
| content_id            | integer    | null: false                    |
| deliver_charge_id     | integer    | null: false                    |
| deliver_day_id        | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchase
- belongs_to_active_hash :category_id
- belongs_to_active_hash :content_id
- belongs_to_active_hash :deliver_charge_id
- belongs_to_active_hash :deliver_day_id
- belongs_to_active_hash :prefecture_id

## purchasesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------  | -------------------------------|
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :address

## addressesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------  | -------------------------------|
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
- belongs_to_active_hash :prefecture