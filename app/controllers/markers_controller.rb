class MarkersController < ApplicationController

    def get_markers
      # byebug
        lat = params["latLong"]["latlong"]["lat"]
        long = params["latLong"]["latlong"]["lng"]
        # lat=40.0274&lon=-105.2519

        string_response = RestClient.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=theater&location=#{lat},#{long}&radius=15&key=#{ENV["GOOGLE_MAPS_API_KEY"]}")
        markers_hash = JSON.parse(string_response)
        @results = []
        markers_hash["results"].each do |theater|
          if theater["icon"] == "https://maps.gstatic.com/mapfiles/place_api/icons/movies-71.png"
            one_marker = {

            latlong: theater["geometry"]["location"],
            address: theater["formatted_address"],
            icon: theater["icon"],
            name: theater["name"],
            opening_hours: theater["opening_hours"],
            id: theater["place_id"]
            }
            @results << one_marker
          end
        end
        render :json => @results
  
      end

end