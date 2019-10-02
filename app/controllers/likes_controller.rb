class LikesController < ApplicationController
    def index
        likes = Like.all
        render json: likes
    end

    def show
        like = Like.find(params[:like_params])
        render json: like
    end

    def update
        byebug
    end

    private
    def like_params
        params.require(:like).permit(:like, :unlike, :to_watch, :movie_id, :user_id)
    end

end
