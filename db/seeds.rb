# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# iris= User.create(name: "Iris", city: "Seattle", password: "1234")
# ellyn= User.create(name: "Ellyn", city: "Denver", password: "12345")
# nick= User.create(name: "Nick", city: "Indianapolis", password: "123")
# brittan= User.create(name: "Brittan", city: "NYC", password: "1")
iris= User.create(name: "Iris", city: "Seattle", username: "iris", password: 1)
ellyn= User.create(name: "Ellyn", city: "Denver", username: "ellyn", password: 1)
nick= User.create(name: "Nick", city: "Indianapolis", username: "nick", password: 1)
brittan= User.create(name: "Brittan", city: "NYC", username: "brittan", password: 1)

iris_pref = Preference.create(user: iris, strength: 8)
ellyn_pref = Preference.create(user: ellyn, strength: 9)
nick_pref = Preference.create(user: nick, strength: 3)
brittan_pref = Preference.create(user: brittan, strength: 7)


movie1= Movie.create(title: "the test 1", rating: "PG", summary: "the test 1 summary", rotten_score: 90, imdb_score: 5, opening_date: "Sep 27, 2019")
movie2= Movie.create(title: "the test 2", rating: "R", summary: "the test 2 summary", rotten_score: 99, imdb_score: 9, opening_date: "Sep 28, 2019")
movie3 = Movie.create(title: "the test 3", rating: "PG13", summary: "the test 3 summary", rotten_score: 10, imdb_score: 2, opening_date: "Sep 29, 2019")

allgenres = ["Action","Adventure","Animation","Biography","Comedy","Crime","Documentary","Drama","Family","Fantasy","Film Noir","History","Horror","Music","Musical","Mystery","Romance","Sci-Fi","Short","Sport","Superhero","Thriller","War","Western"]

allgenres.each do |genre|
    Genre.create(name: genre)
end

# genre1= Genre.create(name: "genre1")
# genre2= Genre.create(name: "genre2")
# genre3= Genre.create(name: "genre3")
# genre4= Genre.create(name: "genre4")

# list1= List.create(name: "favorites", user: iris)
# list2= List.create(name: "favorites", user: brittan)
# list3= List.create(name: "least", user: nick)
# list4= List.create(name: "least", user: ellyn)
# list5= List.create(name: "top", user: iris)






