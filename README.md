# usersテーブル
| Column                    | Type        | Option            |
|:--------------------------|------------:|:-----------------:|
| nickname                  | string      | null: false       |
| email                     | string      | null: false       |
| encrypted_password        | string      | null: false       |
| birth                     | date        | null: false       |
| first_name                | string      | null: false       |
| last_name                 | string      | null: false       |
| first_name_kana           | string      | null: false       |
| last_name_kana            | string      | null: false       |
<!-- 新規登録のときはすべて同じテーブルに保存される -->
<!-- deviseのでの実装なのでdeviseが予め用意しているencrypted_passwordにする -->
<!-- 誕生日カラムはdate型で用意したほうが簡単。dateは年月日を１つで指定して取得できるから -->
<!-- なぜ has_many :buyers？-->
##association user
has_many :comments
has_many :items

has_one :buy_mane
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
| user                | references  | foreign_key: true |
<!-- アクティブハッシュを使うから_idをつけている -->
<!-- imageカラムは削除アクティブストレージ使うから -->
<!-- references型で描くときはカラム名の_idは不要 -->

## association item
has_many :comments
belongs_to :user

has_one :buy_mane
---------------------------------------------------------------



# commentテーブル
| Column     | Type        | Option           |
|:-----------|------------:|:----------------:|
| comment    | text        | null: false      |
| user       | references  | foreign_key: true|
| item       | references  | foreign_key: true|

<!-- references型で記述するときは_idは不要 -->

## association comment
belongs_to :user
belongs_to :item
----------------------------------------------------------
<!-- 購入を管理するテーブルmaneはmanegement -->
# buy_mane テーブル 
| Column     | Type        | Option           |
|:-----------|------------:|:----------------:|
| user       | references  | foreign_key: true|
| item       | references  | foreign_key: true|

<!-- references型で記述するときは_idは不要 -->

## association buy_mane

belongs_to :user
belongs_to :item
has_one :buyer_home
----------------------------------------------------------

## buyer_home
| Column                   | Type                    | Option                  |
|:------------------------:|:------------------------|------------------------:|
| post_num                 | string                  | null: false             |
| pref_id                  | integer                  | null: false            |
| city                     | string                  | null: false             |
| street                   | string                  | null: false             |
| building                 | string                  |                         |
| phone_num                | string                  | null: false             |
| buy_mane                 | references              | foreign_key: true       |

<!-- buyer_homeにbuy_maneの外部キーを参照するカラム必要 -->
<!-- post_numはハイフンが必要なことを考慮してstring型にする -->
<!-- phone_numは数字の文字列として実装するためstring型で実装 -->
## association
 
 belongs_to :buy_mane 
-------------------------------------------------------------- 






























<!-- 後で聞く 今は必要 -->
<!-- これを消したらbuyer_idはどこから参照される？ -->
<!-- # buyerテーブル
| Column          | Type                    | Option                  |
|:----------------|------------------------:|:-----------------------:|
| item            | references              | foreign_key: true       |
| user            | references              | foreign_key: true       |
<!-- クレカの情報はセキュリティ観点から直接データベースに保存しない -->
<!-- references型で記述するときは_idは不要 -->
<!-- ## association buyer
belongs_to :item
belongs_to :user
has_one :buy_mane --> -->
