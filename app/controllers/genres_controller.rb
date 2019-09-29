class GenresController < ApplicationController
    def index
        genres = Genre.all
        render json: genres
    end

    def new
        @genre= Genre.new
    end

    def create
        # byebug
        @genre=Genre.new(name: params[:name])
        @genre.save
        render :json => @genre

    end


    def show
        genre = Genre.find(params[:id])
        render json: genre
    end
end
