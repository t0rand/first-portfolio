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
  password: 't0rend',
  is_admin: 'TRUE',
  is_deleted: 'FALSE'},
  #{
  #id: '2',
  #name: 'テストユーザー',
  #email: 'bb@bbb',
  #encrypted_password: '11111111',
  #is_admin: 'FALSE',
  #is_deleted: 'FALSE',
  #}
  ])

Maker.create!([{
  id: '1',
  name: 'PENTAX'},
  {
  id: '2',
  name: 'SIGMA'},
  {
  id: '3',
  name: 'Nikon'},
  {
  id: '4',
  name: 'Canon'},
  {
  id: '5',
  name: 'FUJIFILM'}])

Product.create!([{
  id: '1',
  name: 'Pentax KP',
  introduction: 'テストテスト',
  maker_id: '1',
  release_date: '19920121',
  is_lens: 'false',
  is_sales: 'true'},
  {
  id: '2',
  name: '18-35mm F1.8 DC HSM | Art',
  introduction: 'テストテスト',
  maker_id: '2',
  release_date: '19940813',
  is_lens: 'false',
  is_sales: 'true'}])