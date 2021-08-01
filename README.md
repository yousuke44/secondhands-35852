## アプリケーション情報

1. アプリケーション名
 - secondhands-35852

2. アプリケーション概要
 - 大学の講義で使用した教科書を売買する通販サイト

3. URL
 - https://secondhands-35852.herokuapp.com/

4. テスト用アカウント
 - Bacic認証ID：admin
 - Bacic認証PW：nb120403sf
 - テスト出品用ユーザーアドレス：test123@test123.com
 - テスト出品用ユーザーパスワード：test123
 - テスト購入用ユーザーアドレス：test456@test456.com
 - テスト購入用ユーザーアドレス：test456
 - テスト購入用クレジットカード番号：4242424242424242
 - テスト購入用クレジットカード有効期限： 3 / 25
 - テスト購入用クレジットカードセキュリティコード：123  
 ※出品時の商品画像については、24時間で非表示になります。

5. 利用方法
 - 新規会員登録をすることで商品の閲覧、出品、購入可能です。
 - 自身が出品した商品は編集・削除が可能です。
 - 出品、売却した商品はマイページに情報が表示されます
 - 検索機能を使い、商品の検索が可能です。

6. 目指した課題解決
 - 大学の講義で使用する教科書は専門書が多く高価な本が多いが、半年ほどしか使わず非常に勿体無いと感じておりました。
 - 教科書の販売に特化したアプリがあれば、出品者と購入者のマッチングがしやすく、売買の効率がいいと考えこのアプリの開発をしました。

7. 洗い出した要件
 - Basic認証
 - ユーザー管理機能
 - 商品出品機能
 - 商品編集・削除機能
 - 商品詳細機能
 - 商品一覧機能
 - 商品検索機能
 - 商品購入機能
 - マイページ機能

8. 実装した機能についての画像やGIFおよびその説明
 - ユーザー管理機能・商品一覧機能
 必須項目を全て入力することで会員登録ができます  
 会員登録・ログインすることで、商品の一覧ページへ進むことができます。
![](https://gyazo.com/cc26db4bccd9db05c51996d743e11b9d.gif)

 - 商品出品機能  
 必須項目を全て入力することで商品の出品ができます
![](https://gyazo.com/c2854b0824ac2302d9dc72f4ce3a83fc.gif)

 - 商品編集・削除機能  
 ログインユーザーと出品者が同じ場合にのみ商品情報の編集・削除ができます。
![](https://gyazo.com/270d22fe738cefa75cb5ca177f52af65.gif)
![](https://gyazo.com/570fcdf3251cbc688995ecd3ddf1011d.gif)

 - 商品詳細機能  
 商品一覧で商品画像や商品情報をクリックすると商品の詳細ページへ遷移します。  
 ログインユーザーと出品者が同じ場合には、編集・削除ボタンが表示され、ログインユーザーと出品者が異なる場合には購入ボタンが表示されます。

 - 商品検索機能  
 ログイン後の商品一覧画面の上部にある検索バーに商品名・講義名・先生名を入力して検索ボタンを押すと該当する商品が検索できます。  
 検索は入力したキーワードが含まれる商品を検索します。
![](https://gyazo.com/a317ba408b43fabc908c21fba4683efb.gif)

 - 商品購入機能  
 商品購入画面で必要事項を入力すると商品購入ができます。

 - マイページ機能  
 出品商品、販売商品の一覧をマイページで表示します。  
 出品中の商品は編集・削除・詳細ボタンが表示され、売却済み商品は詳細ボタンのみが表示されます。
![](https://gyazo.com/7308ed5914807be14b55346e12fee872.gif)


9. データベース設計
![](https://gyazo.com/ed4c2061fcd6bc875d74581c0aa441e4.png)


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
