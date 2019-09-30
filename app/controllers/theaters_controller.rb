class TheatersController < ApplicationController
    def get_theater_info
        string_response = RestClient.get("https://maps.googleapis.com/maps/api/place/details/json?place_id=#{params[:place_id]}&fields=name,url,photo,formatted_address,place_id&key=#{ENV["GOOGLE_MAPS_API_KEY"]}")
        response_hash = JSON.parse(string_response)
        theater_name = response_hash["result"]["name"]
        theater_photos = response_hash["result"]["photos"]
        theater_url = response_hash["result"]["url"]
        theater_addy = response_hash["result"]["formatted_address"]
        @results = {
            name: theater_name,
            pics: theater_photos,
            url: theater_url,
            addy: theater_addy
        }
        render :json => @results
        ## results should be accessed in the then statement of the fetch that hits this controller action - we can pass them into whichever function actually makes the map
    end
end
