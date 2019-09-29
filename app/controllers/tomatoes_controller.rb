require 'pry'
require 'mechanize'
require 'nokogiri'
require 'open-uri'

class TomatoesController < ApplicationController
    
    def get_movies
        genre_hash = {
            "Action": 1,
            "Animation": 2,
            "ArtForeign": 4,
            "Classics": 5,
            "Comedy": 6,
            "Documentary": 8,
            "Drama": 9,
            "Horror": 10,
            "KidsFamily": 11,
            "Mystery": 13,
            "Romance": 18,
            "ScifiFantasy": 14
        }
        allgenres = ["Action","Adventure","Animation","Biography","Comedy","Crime","Documentary","Drama","Family","Fantasy","Film Noir","History","Horror","Music","Musical","Mystery","Romance","Sci-Fi","Short","Sport","Superhero","Thriller","War","Western"]
        # binding.pry


        ## need to set up an event listener that triggers a post fetch request that sends a url in the body of the request
        ## actually because the only thing changing in the rotten tomatoes url will be genres we would just need to send the user preferences up
        ## url is : https://www.rottentomatoes.com/browse/opening?minTomato=0&maxTomato=100&genres=1;2;4;5;6;8;9;10;11;13;18;14&sortBy=popularity
        ## need to set up a hash with genre number key value pairs
        mechanize = Mechanize.new
        # page = mechanize.get("https://www.rottentomatoes.com/browse/opening?minTomato=0&maxTomato=100&genres=1;2;4;5;6;8;9;10;11;13;18;14&sortBy=popularity")
        # noko_page = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/opening"))
        # rest_noko_page = Nokogiri::HTML(RestClient.get("https://www.rottentomatoes.com/browse/opening"))


        ##trying imdb now since rotten tomatoes is a bust 
        imdb_page = Nokogiri::HTML(open("https://www.imdb.com/movies-in-theaters/"))
        imdb_mech = mechanize.get("https://www.imdb.com/movies-in-theaters/")
        imdb_list_items = imdb_mech.search("div.list_item")
        # binding.pry
        movies = {}
        imdb_list_items.each do |list_item|
            genres = list_item.children[1].children[1].children[1].children[3].children[3].children.select do |child| 
                child.text.length > 1 && child.text.length
            end
            genres = genres.map{|genre| genre.children.text }.select{|genre| !genre.empty?}
            genres.shift
            # binding.pry
            my_genre = genres.any? do |genre|
                params[:genres].include?(genre)
            end
            if my_genre
                # binding.pry
                item = list_item.children[1].children[1].children[1].children[1].children[1].children[1].children[1].children[1].attributes["title"].value
                

                if !movies[item]
                    movies[item] = {}
                end
                movies[item]["title"] = list_item.children[1].children[1].children[1].children[1].children[1].children[1].children[1].children[1].attributes["title"].value
                movies[item]["imdb_url"] = "https://www.imdb.com/" + list_item.children[1].children[1].children[1].children[1].children[1].children[1].attributes["href"].value 
                movies[item]["movie_poster"] = list_item.children[1].children[1].children[1].children[1].children[1].children[1].children[1].children[1].attributes["src"].value
                ##below errors out
                rating = list_item.children[1].children[1].children[1].children[3].children[3].children[1].attributes
                # binding.pry
                if !!rating["title"]
                    rating = rating["title"].value
                else
                    rating = nil
                end
                # binding.pry
                movies[item]["rating"] = rating
                movies[item]["runtime"] = list_item.children[1].children[1].children[1].children[3].children[3].children[3].children[0].text
            
    

                movies[item]["genres"] = genres

                summary = list_item.children[1].children[1].children[1].children[3].children[7].children.text
                
                movies[item]["summary"] = summary.strip
            
                ##this grabs stars of the movie - weird formatting again
                stars = list_item.children[1].children[1].children[1].children[3].children[11].text.split("\n").join("").strip
                movies[item]["stars"] = stars

                ##this grabs the end of the url for the movie trailer 
                #this errors out - need to look into
                trailer = list_item.children[1].children[1].children[3].children[1].children[3].attributes["href"]
                if !!trailer
                    trailer = "https://www.imdb.com" + trailer.value
                end
                # binding.pry
                movies[item]["trailer"] = trailer
                # --> "/video/imdb/vi3789077529"  the trailer will be at https://www.imdb.com/videoplayer/vi3789077529

                ##this grabs a url to get showtimes and theaters
                #errors out - need to investigate
                showtimes = list_item.children[1].children[1].children[3].children[1].children[10]
                # binding.pry
                if !!showtimes
                    showtimes = "https://www.imdb.com" + showtimes.attributes["href"].value
                end
                movies[item]["showtimes"] = showtimes
            end

        end

        ## this grabs the end of the imdb url with info about the movie
        ## "/title/tt6324278"
        imdb_url = imdb_page.css("div.list_item")[0].children[1].children[1].children[1].children[1].children[1].children[1].attributes["href"].value 

        ## this grabs the title of the movie
        movie_title = imdb_page.css("div.list_item")[0].children[1].children[1].children[1].children[1].children[1].children[1].children[1].children[1].attributes["title"].value

        ##this grabs the movie poster url
        movie_poster = imdb_page.css("div.list_item")[0].children[1].children[1].children[1].children[1].children[1].children[1].children[1].children[1].attributes["src"].value


        ##this grabs the movie rating (pg, pg13, r, etc)
        rating = imdb_page.css("div.list_item")[0].children[1].children[1].children[1].children[3].children[3].children[1].attributes["title"].value


        ##this grabs the string showing runtime with min
        runtime = imdb_page.css("div.list_item")[0].children[1].children[1].children[1].children[3].children[3].children[3].children[0].text

        ## this might be better though, gets runtime along with genres
        runtime_and_genres = imdb_page.css("div.list_item")[0].children[1].children[1].children[1].children[3].children[3].children.select do |child| 
            child.text.length > 1 && child.text.length
        end

        ##this grabs the one sentence summary of the movie, the formatting is weird though 
        movie_summary = imdb_page.css("div.list_item")[0].children[1].children[1].children[1].children[3].children[7].children.text


        ##this grabs stars of the movie - weird formatting again
        stars = imdb_page.css("div.list_item")[0].children[1].children[1].children[1].children[3].children[11].children.text.split("\n")

        ##this grabs the end of the url for the movie trailer 
        trailer_url = imdb_page.css("div.list_item")[0].children[1].children[1].children[3].children[1].children[3].attributes["href"].value
        ## --> "/video/imdb/vi3789077529"  the trailer will be at https://www.imdb.com/videoplayer/vi3789077529

        ##this grabs a url to get showtimes and theaters
        showtimes = imdb_page.css("div.list_item")[0].children[1].children[1].children[3].children[1].children[10].attributes["href"].value
        ## => "/showtimes/title/tt6324278/" https://www.imdb.com/showtimes/title/tt6324278
        ## appears to use geo-location to populate theaters


            
        # activities = page.search("div.activity div")
    
        # puts camp_info[0].text.strip
    
    
        # puts "Activities"

        # array_of_activities = []
        # activities.each do |activity|
        #     array_of_activities << activity.text
        # end

        @results =  movies  

        render :json => @results
    end


end