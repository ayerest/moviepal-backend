class MarkersController < ApplicationController
    def get_markers
        
        lat = params["latLong"]["lat"]
        long = params["latLong"]["lng"]
        # lat=40.0274&lon=-105.2519
        string_response = RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=47.608013,-122.335167&radius=50&type=movie_theater&key=#{ENV["GOOGLE_MAPS_API_KEY"]}")
        markers_hash = JSON.parse(string_response)

        byebug
        @results = []
        markers_hash["campgrounds"].each do |marker|
            one_marker = {
            latlong: {lat: marker["latitude"], lng: marker["longitude"]},
            address: marker["location"],
            camp_name: marker["name"],
            url: marker["url"],
            imgUrl: marker["imgUrl"]
            }
            @results << one_marker
        end
        
        render :json => @results

  
      end

end