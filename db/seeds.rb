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


