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

    def update
        movie = Movie.find(params[:id])
        byebug
    end

    def destroy
    end
end
