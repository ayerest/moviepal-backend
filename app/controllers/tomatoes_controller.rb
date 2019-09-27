require 'pry'

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
        binding.pry


        ## need to set up an event listener that triggers a post fetch request that sends a url in the body of the request
        ## actually because the only thing changing in the rotten tomatoes url will be genres we would just need to send the user preferences up
        ## url is : https://www.rottentomatoes.com/browse/opening?minTomato=0&maxTomato=100&genres=1;2;4;5;6;8;9;10;11;13;18;14&sortBy=popularity
        ## need to set up a hash with genre number key value pairs
        mechanize = Mechanize.new
        page = mechanize.get("https://www.rottentomatoes.com/browse/opening?minTomato=0&maxTomato=100&genres=1;2;4;5;6;8;9;10;11;13;18;14&sortBy=popularity")
        
        # all movies page.search("div.mb-movies")  mb-movie grabs a single movie
        
        # camp_info = page.search("div.description")
        
        # activities = page.search("div.activity div")
    
        # puts camp_info[0].text.strip
    
        # puts ""
    
        # puts "Activities"

        # array_of_activities = []
        # activities.each do |activity|
        #     array_of_activities << activity.text
        # end

        @results = {
            # arrayOfActivities: array_of_activities,
            # camp_info: camp_info[0].text.strip
        }

        render :json => @results
    end


end