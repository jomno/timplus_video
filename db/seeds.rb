# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categoryAry = %w(국어 영어 수학 사회 과학 도덕 컴퓨터)
categoryAry.each do |c|
    tempC=Category.create(name: c)
end

user=User.create!(email: 'timplusth', password: '123456', password_confirmation: '123456')
user.add_role :admin