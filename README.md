# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| email     | string | null: not   |
| password  | string | null: not   |
| name      | string | null: not   |
| profile   | text   | null: not   |
| occupation| text   | null: not   |
| position  | text   | null: not   |

### Association
- has_many : prototypes
- has_many : comments

## prototypes テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| title      | string | null: not |
| catch_copy | text   | null: not |
| concept    | string | null: not |
| image      | (ActiveStorageで実装)
| user       | (references型)

#### Association 
- belongs_to : user
- has_many : comments

## comments テーブル

| Column    | Type      | Options     |
| --------  | ------    | ----------- |
| text      | text      | null: not |
| user      | reference | null: not |
| prototype | reference | null: not 

### Association
- belongs_to : user
- belongs_to : prototypes