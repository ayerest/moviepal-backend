class MarkersController < ApplicationController
    def get_markers
        
        lat = params["latLong"]["lat"]
        long = params["latLong"]["lng"]
        # lat=40.0274&lon=-105.2519
        string_response = RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=30&type=movie_theater&key=#{ENV["GOOGLE_MAPS_API_KEY"]}")
        # string_response = RestClient.get("https://www.hikingproject.com/data/get-campgrounds?lat=#{lat}&lon=#{long}&maxDistance=100&key=#{ENV["CAMPGROUNDS_API_KEY"]}")
          # string_response = RestClient.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=campgrounds+in+#{search_term}&key=#{ENV["GOOGLE_MAPS_API_KEY"]}")
        # string_response = RestClient.get("https://developer.nps.gov/api/v1/campgrounds?stateCode=#{state}&limit=100&fields=addresses&api_key=#{ENV["NATIONAL_PARKS_API_KEY"]}")
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