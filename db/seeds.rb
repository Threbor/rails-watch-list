# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

# List.create(name: "thiller")
# List.create(name: "Comedie")
# List.create(name: "fun")

require "json"
require "open-uri"

Bookmark.delete_all
p "suppression de tous les Bookmark"
List.delete_all
p "suppression de tous les List"
Movie.delete_all
p "suppression de tous les Movie"

List.create(name: "Flims à voir")
List.create(name: "Films déjà vus")

url = "https://tmdb.lewagon.com/movie/top_rated"
movie_list_serialized = URI.open(url).read
movie_list = JSON.parse(movie_list_serialized)

movie_hash = movie_list["results"]

# movie_one_hash = movie_hash[1]

movie_hash.each do |movie|
  Movie.create(
    title: movie["original_title"],
    overview: movie["overview"],
    poster_url: "http://image.tmdb.org/t/p/w500#{movie["backdrop_path"]}",
    rating: movie["vote_average"])
    p "Ajout du film : #{movie["original_title"]}"
end
