# テーブル設計

## users テーブル

| Column             | Type        | Option                   |
| ------------------ | ----------- | ------------------------ |
| nickname           | string      | null: false              |
| email              | string      | null: false              |
| encrypted_password | string      | null: false, unique:true |
| university_id      | integer     | null: false              |
| department_id      | integer     | null: false              |
| subject_id         | integer     | null: false              |
| birthday           | date        | null: false              |

### Association
- has_many :items
- has_many :orders



## items テーブル

| Column                | Type          | Option              |
| --------------------- | ------------- | ------------------- |
| name                  | string        | null: false         |
| price                 | integer       | null: false         |
| year_id               | integer       | null: false         |
| period_id             | integer       | null: false         |
| lecture               | string        | null: false         |
| teacher               | string        | null: false         |
| sales_status_id       | integer       | null: false         |
| scheduled_delivery_id | integer       | null: false         |
| author                | string        | null: false         |
| publisher             | string        | null: false         |
| user                  | references    | foreign_key: true   |

### Association
- belongs_to :user
- has_one :order


## orders テーブル

| Column                | Type          | Option              |
| --------------------- | ------------- | ------------------- |
| user                  | references    | foreign_key: true   |
| item                  | references    | foreign_key: true   |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column                | Type          | Option              |
| --------------------- | ------------- | ------------------- |
| postal_code           | string        | null: false         |
| prefecture_id         | integer       | null: false         |
| city                  | string        | null: false         |
| address               | string        | null: false         |
| building_name         | string        | null: false         |
| last_name             | string        | null: false         |
| first_name            | string        | null: false         |
| last_name_kana        | string        | null: false         |
| first_name_kana       | string        | null: false         |
| phone_number          | string        | null: false         |
| order                 | references    | foreign_key: true   |

### Association
- belongs_to :order
