#usersテーブル
| Column     | Type        | Option            |
|:-----------|------------:|:-----------------:|
| nickname   | string      | null: false       |
| email      | string      | null: false       |
| password   | string      | null: false       |

##association user
has_many :comments
has_many :items
has_one :profile
--------------------------------------------------------
#profilesテーブル
| Column           | Type        | Option              |
|:-----------------|------------:|:------------------: |
| birth            | integer     | null: false         |
| first_name       | string      | null: false         |
| last_name        | string      | null: false         |
| first_name_kana  | string      | null: false         |
| last_name_kana   | string      | null: false         |
| user_id          | references  | foreign_key: true   |


##association profile
belongs_to :user
---------------------------------------------------------------
#itemsテーブル
| Column         | Type        | Option            |
|:---------------|------------:|:-----------------:|
| image          | text        | null: false       |
| name           | string      | null: false       |
| description    | text        | null: false       |
| category       | string      | null: false       | 
| status         | string      | null: false       |
| deliver_burden | string      | null: false       |
| deliver_region | string      | null: false       |
| deliver_date   | integer     | null: false       |
| sell_price     | integer     | null: false       |
| user_id        | references  | foreign_key: true |

##association item
has_many :comments
belongs_to :user
has_one :buyer
-------------------------------------------------------------- 



#buyerテーブル
| Column          | Type                    | Option                  |
|:----------------|------------------------:|:-----------------------:|
| card_num        | integer                 | null: false             |
| validated_date  | integer                 | null: false             |
| security_num    | integer                 | null: false             |
| item_id         | references              | foreign_key: true       |
| post_num        | integer                 | null: false             |
| pref            | string                  | null: false             |
| city            | string                  | null: false             |
| street          | string                  | null: false             |
| building        | string                  |                         |
| phone_num       | integer                 | null: false             |



##association buyer
belongs_to :item
---------------------------------------------------------------



#commentテーブル
| Column     | Type        | Option           |
|:-----------|------------:|:----------------:|
| comment    | text        | null: false      |
| user_id    | references  | foreign_key: true|
| item_id    | references  | foreign_key: true|

##association comment
belongs_to :user
belongs_to :item
----------------------------------------------------------