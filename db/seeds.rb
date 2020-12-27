# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([{
  id: '1',
  name: '管理者',
  email: 'ttt@ttt',
  password: '11111111',
  is_admin: 'TRUE',
  is_deleted: 'FALSE'},
  {
  #id: '2',
  #name: 'テストユーザー',
  #email: 'bb@bbb',
  #encrypted_password: '11111111',
  #is_admin: 'FALSE',
  #is_deleted: 'FALSE',
  }])

Maker.create!([{
  id: '1',
  name: 'Canon'},
  {
  id: '2',
  name: 'Nikon',}])
