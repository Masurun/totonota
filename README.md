# usersテーブル
| Column                    | Type        | Option            |
|:--------------------------|------------:|:-----------------:|
| nickname                  | string      | null: false       |
| email                     | string      | null: false       |
| encrypted_password        | string      | null: false       |
| my_sauna                  | string      | null: false       |
| period_sauna_year         | integer     |                   |
| period_sauna_month        | integer     |                   |


## association users
has_many :posts

------------------------------------------------------

# postsテーブル
| Column                  | Type        | Option            |
|:------------------------|------------:|:-----------------:|
| spa_name                | string      | null: false       |
| visit_time_id           | text        | null: false       |
| congestion_rate_id      | integer     | null: false       | 
| water_temp_id           | integer     | null: false       |
| sauna_temp_id           | integer     | null: false       |
| pref_id                 | integer     | null: false       |
| chair_count_id          | integer     | null: false       |
| review                  | text        | null: false       |
| user                    | references  | foreign_key: true |


## association items
belongs_to :user
