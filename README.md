
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
has_many :items
has_many :transaction



itemsテーブル

| Column                  | Type       | Options                        |
| ------                  | ---------- | ------------------------------ |
| item_name               | string     | null: false,                   |
| item_info               | text       | null: false                    |
| item_category_id        | integer    | null: false,                   |
| item_condition_id       | integer    | null: false,                   |
| item_fee_status_id      | integer    | null: false,                   |　配送料負担
| item_prefecture_id      | integer    | null: false                    |　　発送元の地域
| item_scheduled_id       | integer    | null: false,                   |　発送までの日数 
| item_price              | integer    | null: false,                   |

### Association

belongs_to :user
has_one :transaction


transactionsテーブル 取引

| Column                  | Type       | Options                        |
| ------                  | ---------- | ------------------------------ |
| user                    | references | null: false,foreign_key: true  |
| item                    | references | null: false,foreign_key: true  |

### Association
has_one : address
belongs_to : user
belongs_to :item


addressesテーブル


| Column                  | Type       | Options                        |
| ------                  | ---------- | ------------------------------ |
| postal_code_id          | string     | null: true,                   |
| prefecture_id           | integer    | null: false,                   |
| city                    | string     | null: false,                   |
| addresses               | string     | null: false,                   |
| building                | string     | null: true,                   |
| phone_number            | string     | null: false,                  |
| transaction             | references | null: false,foreign_key: true |

### Association
belongs_to :transaction







 