# usersテーブル
| Column     | Type        | Option            |
|:-----------------|------------:|:-----------------:|
| nickname         | string      | null: false       |
| email            | string      | null: false       |
| password         | string      | null: false       |
| birth            | integer     | null: false       |
| first_name       | string      | null: false       |
| last_name        | string      | null: false       |
| first_name_kana  | string      | null: false       |
| last_name_kana   | string      | null: false       |
<!-- 新規登録のときはすべて同じテーブルに保存される -->
##association user
has_many :comments
has_many :items
has_one :buyer
------------------------------------------------------

# itemsテーブル
| Column              | Type        | Option            |
|:--------------------|------------:|:-----------------:|
| name                | string      | null: false       |
| description         | text        | null: false       |
| category_id         | integer     | null: false       | 
| status_id           | integer     | null: false       |
| deliver_burden_id   | integer     | null: false       |
| deliver_region_id   | integer     | null: false       |
| deliver_date_id     | integer     | null: false       |
| sell_price          | integer     | null: false       |
| user_id             | references  | foreign_key: true |
<!-- アクティブハッシュを使うから_idをつけている -->
<!-- imageカラムは削除　アクティブストレージ使うから -->

## association item
has_many :comments
belongs_to :user
has_one :buyer
has_one :buy_mane
---------------------------------------------------------------



# commentテーブル
| Column     | Type        | Option           |
|:-----------|------------:|:----------------:|
| comment    | text        | null: false      |
| user_id    | references  | foreign_key: true|
| item_id    | references  | foreign_key: true|

## association comment
belongs_to :user
belongs_to :item
----------------------------------------------------------

# buy_mane　テーブル
| Column     | Type        | Option           |
|:-----------|------------:|:----------------:|
| buyer_id   | references  | foreign_key: true|
| item_id    | references  | foreign_key: true|


## association buy_mane
belongs_to :buyer
belongs_to :item
has_one :buyer_home
----------------------------------------------------------

## buyer_home
| Column                   | Type                    | Option                  |
|:------------------------:|:------------------------|------------------------:|
| post_num                 | integer                 | null: false             |
| pref                     | string                  | null: false             |
| city                     | string                  | null: false             |
| street                   | string                  | null: false             |
| building                 | string                  |                         |
| phone_num                | integer                 | null: false             |

## association
 
 belongs_to :buy_mane 
-------------------------------------------------------------- 



# buyerテーブル
| Column          | Type                    | Option                  |
|:----------------|------------------------:|:-----------------------:|
| item_id         | references              | foreign_key: true       |
| user_id         | references              | foreign_key: true       |
<!-- クレカの情報はセキュリティ観点から直接データベースに保存しない -->

##　association buyer
belongs_to :item
belongs_to :user
has_one :buy_mane
