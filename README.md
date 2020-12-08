users テーブル

| Column                  | Type       | Options                        |
| ------                  | ---------- | ------------------------------ |
| email                   | string     | null: false,                   |
| password                | string     | null: false,                   |
| nickname                | string     | null: false,                   |
| last_name               | string     | null: false,                   |
| first_name              | string     | null: false,                   |
| last_name_kana          | string     | null: false,                   |
| first_name_kana         | string     | null: false,                   |
| year                    | integer    | null: false,                   |
| month                   | integer    | null: false,                   |
| day                     | integer    | null: false,                   |

### Association
has_one :address
has_many :items



itemsテーブル

| Column                  | Type       | Options                        |
| ------                  | ---------- | ------------------------------ |
| item_img                | references | null: false,foreign_key: true                  |
| item_name               | string     | null: false,                                   |
| item_info               | references | null: false,foreign_key: true                  |
| item_category           | references | null: false, foreign_key: tru                  |
| item_condition          | references | null: false,foreign_key: true                  |
| item_fee_status         | references | null: false,foreign_key: true                  |　配送料負担
| item_prefecture         | integer    | null: false                                    |　　発送元の地域
| item_scheduled          | references | null: false,foreign_key: true                  |　発送までの日数 
| item_price              | integer    | null: false,                                   |

### Association

belongs_to :user
has_one :address

addressesテーブル


| Column                  | Type       | Options                        |
| ------                  | ---------- | ------------------------------ |
| postal_code             | integer(7) | null: false,                   |
| prefecture              | integer    | null: false,                   |
| city                    | string     | null: false,                   |
| addresses               | string     | null: false,                   |
| building                | string     | null: false,                   |
| phone_number            | integer    | unique: true                   |
| user                    | references | null: ,                        |
| item                    | references | null: ,                        |


### Association
belongs_to :item
belongs_to :user

