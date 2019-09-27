class MoviesController < ApplicationController
    def index
        movies = Movie.all
        render json: movies
    end

    def show
        movie = Movie.find(params[:id])
        render json: movie
    end

    def new
    end

    def create
    end

    def destroy
    end
end
