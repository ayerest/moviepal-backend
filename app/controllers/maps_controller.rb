class MapsController < ApplicationController

    ## need to add a script tag with ID to target in app.js or index.js
    ## once targetted we can change the script tag's src attribute to the google maps url
    ## add in the api key to the url by running a get fetch request to get_api_key
    ## in the .thens of the fetch is where the url gets set
    def get_api_key
        @api_key = {api_key: "#{ENV["GOOGLE_MAPS_API_KEY"]}"}
        render :json => @api_key
    end

    def get_map
        ## params from either geolocation (not sure how to do yet) or from event listener on settings form that grabs the city from the user input
        city = params['city'].gsub(" ","+") 
        string_response = RestClient.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{city}&key=#{ENV["GOOGLE_MAPS_API_KEY"]}")
        response_hash = JSON.parse(string_response)
        lat_long_hash = response_hash["results"][0]["geometry"]["location"]
        formatted_address = response_hash["results"][0]["formatted_address"]
        @results = {
            latlong: lat_long_hash,
            address: formatted_address
        }
        render :json => @results
        ## results should be accessed in the then statement of the fetch that hits this controller action - we can pass them into whichever function actually makes the map
    end


end
