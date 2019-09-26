# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: "Iris", city: "Seattle", password: "1234")
User.create(name: "Ellyn", city: "Denver", password: "12345")User.create(name: "Nick", city: "Indianapolis", password: "123")User.create(name: "Brittan", city: "NYC", password: "1")



Movie.create(title: "the test 1", rating: "PG", summary: "the test 1 summary", rotten_score: 90, imdb_score: 5, opening_date: "Sep 27, 2019")
Movie.create(title: "the test 2", rating: "R", summary: "the test 2 summary", rotten_score: 99, imdb_score: 9, opening_date: "Sep 28, 2019")
Movie.create(title: "the test 3", rating: "PG13", summary: "the test 3 summary", rotten_score: 10, imdb_score: 2, opening_date: "Sep 29, 2019")