# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# statusesテーブルの初期化
Status.create(status: '進行中')
Status.create(status: '待ち')
Status.create(status: '終了')

# prioritiesテーブルの初期化
Priority.create(priority: 'High')
Priority.create(priority: 'Midium')
Priority.create(priority: 'Low')


# テストデータたち
# User.create(name: 'test1', email: 'test1@gmail.com', password: '1234')
# User.create(name: 'test2', email: 'test2@gmail.com', password: '1234')

# Category.create(user_id: 1, category: 'てすとゆーざー１の最初のカテゴリ')
# Category.create(user_id: 2, category: 'てすとゆーざー２の最初のカテゴリ')

# Task.create(user_id: 1, category_id: 1, name: 'ほげほげ', status_id: 1, priority_id: 1, start: "2021-01-01", deadline: "2021-02-10")
# Task.create(user_id: 1, category_id: 1, name: 'ふがふが', status_id: 2, priority_id: 2, start: "2021-01-01", deadline: "2021-02-10")
# Task.create(user_id: 1, category_id: 1, name: 'ほげふが', status_id: 3, priority_id: 3, start: "2021-01-01", deadline: "2021-02-10")
