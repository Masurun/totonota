# Totonota
サウナ専門の投稿サイト

# 概要
<dt>自分の行ったサウナの記録、共有できる。</dt>
<dt>サウナ、水風呂の温度、都道府県で簡単に検索</dt>
![代替テキスト](https://gyazo.com/81433fb18b3a2ec7387bd50c209dd926)

# App URL
https://totonota.herokuapp.com/

# 課題解決
| ユーザーストーリー           | 課題解決             |                                            | 
|:--------------------------|--------------------:|-------------------------------------------:|
| サウナの要素が多すぎて調べるのが大変                  | 水風呂、サウナ、都道府県だけで調べられるようにした。|
| いつ頃行くと混んでいるのか残したい                    | 入力フォームに混雑時間、訪問時間を追加した。      |

# 機能一覧

| Column                    |
|:--------------------------|
| ユーザー管理機能             |
| 投稿機能                    |
| 投稿編集削除機能             |
| 投稿詳細機能                |
| ユーザー詳細機能             |
| お気にいり機能               |
| コメント機能                 |

# 追加実装予定
非同期通信によるコメント機能、お気にいり機能
ページネーション機能




#  開発環境

- VScode
- Ruby 2.6.5
- Rails 6.0.3.4
- mysql2 0.5.3
- JavaScript
- gem 3.0.3
- heroku 7.46.0
- Amazon Simple Storage Service




# usersテーブル
| Column                    | Type        | Option            |
|:--------------------------|------------:|:-----------------:|
| nickname                  | string      | null: false       |
| email                     | string      | null: false       |
| encrypted_password        | string      | null: false       |
| my_sauna                  | string      |                   |
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
| review                  | text        |                   |
| user                    | references  | foreign_key: true |


## association items
belongs_to :user
