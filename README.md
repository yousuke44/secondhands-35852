## アプリケーション情報

1. アプリケーション名
 - secondhands

2. アプリケーション概要
 - 同じ大学の生徒間で授業で使用する教科書を売買できるフリマアプリ

3. URL
 - https://secondhands-35852.herokuapp.com/

4. テスト用アカウント
 - Bacic認証ID：admin
 - Bacic認証ID：nb120403sf

5. 利用方法
 - 新規会員登録をすることで商品の閲覧、出品、購入ができる。
 - 自身が出品した商品は編集・削除が可能
 - 購入、出品、売却した商品はマイページに情報が表示される

6. 目指した課題解決
 - フリマアプリなどで商品を売却する際に、ニーズが分からず売買では非常に非効率であると感じた。
 - 出品者・購入者を大学生に限定することで売買時のマッチングの効率を上げた

7. 洗い出した要件
 - Basic認証
 - ユーザー管理機能
 - 商品出品機能
 - 商品編集・削除機能
 - 商品一覧機能
 - 商品検索機能
 - 購入機能

8. 実装した機能についての画像やGIFおよびその説明
 - 

9. データベース設計
[![Image from Gyazo](https://i.gyazo.com/4aa71310dc81283afd03774a6c8d2840.png)](https://gyazo.com/4aa71310dc81283afd03774a6c8d2840)


# テーブル設計

## users テーブル

| Column             | Type        | Option                   |
| ------------------ | ----------- | ------------------------ |
| nickname           | string      | null: false              |
| email              | string      | null: false              |
| encrypted_password | string      | null: false, unique:true |
| university_id      | integer     | null: false              |
| department_id      | integer     | null: false              |
| birthday           | date        | null: false              |

### Association
- has_many :items
- has_many :orders



## items テーブル

| Column                | Type          | Option              |
| --------------------- | ------------- | ------------------- |
| name                  | string        | null: false         |
| price                 | integer       | null: false         |
| year_period_id        | integer       | null: false         |
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
