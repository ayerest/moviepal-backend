require 'pry'
require 'mechanize'
require 'nokogiri'
require 'open-uri'

class TomatoesController < ApplicationController

    def get_movies
        user = User.find_by(id: params["user"]["id"])
        mechanize = Mechanize.new
        ## imdb since rotten tomatoes is a bust 
        imdb_page = Nokogiri::HTML(open("https://www.imdb.com/movies-in-theaters/"))

        imdb_mech = mechanize.get("https://www.imdb.com/movies-in-theaters/")

        imdb_list_items = imdb_mech.search("div.list_item")
        
        movies = []
        imdb_list_items.each do |list_item|
            genres = list_item.children[1].children[1].children[1].children[3].children[3].children.select do |child| 
                child.text.length > 1 && child.text.length
            end
            genres = genres.map{|genre| genre.children.text }.select{|genre| !genre.empty?}
            genres.shift
            my_genre = genres.any? do |genre|
                params[:genres].include?(genre)
            end
            if my_genre


                item = list_item.children[1].children[1].children[1].children[1].children[1].children[1].children[1].children[1].attributes["title"].value
                
                my_movie_hash = {}
                
                my_movie_hash["title"] = list_item.children[1].children[1].children[1].children[1].children[1].children[1].children[1].children[1].attributes["title"].value
                my_movie_hash["imdb_url"] = "https://www.imdb.com/" + list_item.children[1].children[1].children[1].children[1].children[1].children[1].attributes["href"].value 
                my_movie_hash["poster_img"] = list_item.children[1].children[1].children[1].children[1].children[1].children[1].children[1].children[1].attributes["src"].value
                
                rating = list_item.children[1].children[1].children[1].children[3].children[3].children[1].attributes
                if !!rating["title"]
                    rating = rating["title"].value
                else
                    rating = nil
                end
                
                my_movie_hash["rating"] = rating
                
                my_movie_hash["runtime"] = list_item.children[1].children[1].children[1].children[3].children[3].children[3].children[0].text
            
                my_movie_hash["genres"] = genres

                summary = list_item.children[1].children[1].children[1].children[3].children[7].children.text
                
                my_movie_hash["summary"] = summary.strip
            
                stars = list_item.children[1].children[1].children[1].children[3].children[11].text.split("\n").join("").strip.split(":")
                stars.shift
                my_movie_hash["stars"] = stars
                # byebug

                trailer = list_item.children[1].children[1].children[3].children[1].children[3].attributes["href"]
                if !!trailer
                    trailer = trailer.value.split("/")
                    trailer = trailer[trailer.length - 1]
                    trailer = "https://www.imdb.com/videoembed/" + trailer
                end

                my_movie_hash["trailer"] = trailer
                # --> "/video/imdb/vi3789077529"  the trailer will be at https://www.imdb.com/videoplayer/vi3789077529

                showtimes = list_item.children[1].children[1].children[3].children[1].children[10]

                if !!showtimes
                    showtimes = "https://www.imdb.com" + showtimes.attributes["href"].value
                end

                my_movie_hash["showtimes"] = showtimes
                movie_in_db = Movie.find_by(title: my_movie_hash["title"])
                if movie_in_db
                    if !user.movies.include?(movie_in_db)
                        user.movies << movie_in_db
                    end
                else
                    new_movie = Movie.create(title: my_movie_hash["title"], summary: my_movie_hash["summary"], rating: my_movie_hash["rating"], poster_img: my_movie_hash["poster_img"], trailer_url: my_movie_hash["trailer"], stars: my_movie_hash["stars"], showtimes_url: my_movie_hash["showtimes"], imdb_url: my_movie_hash["imdb_url"] )
                    user.movies << new_movie
                end

                movies.push(my_movie_hash)
            end
        end  

        # binding.pry

        @results =  movies  

        render :json => @results
    end
end