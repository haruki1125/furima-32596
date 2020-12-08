
users テーブル

| Column                  | Type       | Options                        |
| ------                  | ---------- | ------------------------------ |
| email                   | string     | null: false,                   |
| encrypted_password      | string     | null: false,                   |
| nickname                | string     | null: false,                   |
| last_name               | string     | null: false,                   |
| first_name              | string     | null: false,                   |
| last_name_kana          | string     | null: false,                   |
| first_name_kana         | string     | null: false,                   |
| birthday                | date       | null: false,                   |


### Association
has_one :address
has_many :items



itemsテーブル

| Column                  | Type       | Options                        |
| ------                  | ---------- | ------------------------------ |
| item_name               | string     | null: false,                   |
| item_info               | text       | null: false                    |
| item_category           | integer    | null: false,                   |
| item_condition          | integer    | null: false,                   |
| item_fee_status         | integer    | null: false,                   |　配送料負担
| item_prefecture         | integer    | null: false                    |　　発送元の地域
| item_scheduled          | integer    | null: false,                   |　発送までの日数 
| item_price              | integer    | null: false,                   |

### Association

belongs_to :user
has_one :address
has_one :transaction

addressesテーブル


| Column                  | Type       | Options                        |
| ------                  | ---------- | ------------------------------ |
| postal_code             | string     | null: false,                   |
| prefecture              | integer    | null: false,                   |
| city                    | string     | null: false,                   |
| addresses               | string     | null: false,                   |
| building                | string     | null: false,                   |
| phone_number            | integer    | unique: true                   |
| user                    | references | null: false,foreign_key: true  |
| item                    | references | null: false,foreign_key: true  |


### Association
belongs_to :item
belongs_to :user

transactionsテーブル 取引

| Column                  | Type       | Options                        |
| ------                  | ---------- | ------------------------------ |
| user                    | references | null: false,foreign_key: true  |
| item                    | references | null: false,foreign_key: true  |

### Association
belongs_to :item





 