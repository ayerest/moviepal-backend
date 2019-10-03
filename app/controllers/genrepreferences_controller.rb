class GenrepreferencesController < ApplicationController

    def index
        genrepreferences = GenrePreference.all
        render json: genrepreferences
    end

    def show
        genrepreference = GenrePreference.find(params[:id])
        render json: genrepreference
    end
