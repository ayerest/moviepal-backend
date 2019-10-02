class RottensController < ApplicationController


    def get_movie_user_like_record
        byebug
        myLike = return Like.find_by(user_id: params[:user_id], movie_id: params[:movie_id]).id
    end

    def show
        @like = Like.find(params[:user_id], params[:movie_id])
        render json: @likes
    end

    private 

    def rottens_params
        params.require(:like).permit(:user_id, :movie_id)
    end




        ##############################
        #this gets the movie details for one movie
        ## need to set up an event listener that triggers a post fetch request that sends a movie object in the body of the request
        ## need to make sure routes are set up properly - since 2 post requests in this controller now
        # give it another name like "grab" instead of post in the fetch request
        # need the movie title from the movie object - need to do splitting / replacing spaces and colons with underscores
        # ANTHROPOCENE: The Human Epoch
        mechanize = Mechanize.new
        page = mechanize.get("https://www.rottentomatoes.com/m/anthropocene_the_human_epoch")

         # camp_info = page.search("div.description")
        
        # activities = page.search("div.activity div")
    
        # puts camp_info[0].text.strip
    
        # puts ""
    
        # puts "Activities"

        # array_of_activities = []
        # activities.each do |activity|
        #     array_of_activities << activity.text
        # end

        # @results = {
        #     # arrayOfActivities: array_of_activities,
        #     # camp_info: camp_info[0].text.strip
        # }

        # render :json => @results

end