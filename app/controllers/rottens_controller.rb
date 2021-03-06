class RottensController < ApplicationController


    def get_movie_user_like_record
        myLike = Like.find_by(user_id: rottens_params[:user_id], movie_id: rottens_params[:movie_id])
        user = User.find_by(id: params[:user_id])
        movie= Movie.find_by(id: params[:movie_id])
        # findLikeId=like_user_id.find(movie_id: params[:movie_id])
        type = rottens_params[:type]
        if type === "like"
            myLike.update(like: !myLike.like)
        elsif type === "unlike"
            myLike.update(unlike: !myLike.unlike)
        else
            myLike.update(to_watch: !myLike.to_watch)
        end
        # byebug

        # like.update(id: like.id, user_id: like_user_id.id, movie_id: like_movie_id.id, like: (!findLikeId.like), unlike: findLikeId.unlike, to_watch: findLikeId.to_watch)
        render json: myLike
    end

   
    private 
    
    def rottens_params
        params.permit(:user_id, :movie_id, :like, :unlike, :to_see, :type)
    end

    

end






























        ###################################################
        ###################################################
        #this gets the movie details for one movie
        ## need to set up an event listener that triggers a post fetch request that sends a movie object in the body of the request
        ## need to make sure routes are set up properly - since 2 post requests in this controller now
        # give it another name like "grab" instead of post in the fetch request
        # need the movie title from the movie object - need to do splitting / replacing spaces and colons with underscores
        # ANTHROPOCENE: The Human Epoch
        # mechanize = Mechanize.new
        # page = mechanize.get("https://www.rottentomatoes.com/m/anthropocene_the_human_epoch")

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

