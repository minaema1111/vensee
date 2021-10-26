# テーブル設計

## users テーブル(ユーザー情報)

| Column        | Type    | Option
|---------------|---------|---------------
| nickname      | string  | null: false
| email         | string  | null: false, unique: true
| password      | string  | null: false

### association
- has_many :venders
- has_many :comments

## venders テーブル(自販機情報)

| Column       | Type       |  Option
|--------------|------------|-----------
| user         | references | null: false, foreign_key: true
| title        | string     | null: false
| genre_id     | integer    | null: false
| introduction | text       | 
| residence    | text       | null: false

### association
- belongs_to :user
- has_many :comments
- has_one_attached :image

## comments テーブル(コメント情報)

| Column |  Type      |  Option 
|--------|------------|-------------------------------
| user   | references | null: false, foreign_key: true
| text   | text       | 

### association
- belongs_to :user
- belongs_to :vender