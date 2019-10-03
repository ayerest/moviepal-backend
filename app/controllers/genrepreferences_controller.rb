class GenrepreferencesController < ApplicationController
    def create
        
        byebug
        user = User.find(genre_params[:user])
        genreName = genre_params[:genre].capitalize
        genre = Genre.find_by(name: genreName)
        if genre_params[:status] == "on"
            user.preference.genres << genre
        else
            user.preference.genres.delete(genre)
        end
        render :json => user

    end

    private

    def genre_params
        params.permit(:genre, :user, :status, :genrepreference)
    end

    def show
        genrepreference = GenrePreference.find(params[:id])
        render json: genrepreference
    end
