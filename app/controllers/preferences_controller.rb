class PreferencesController < ApplicationController
    def index
        preferences = Preference.all
        render json: preferences
    end

    def show
        preference = Preference.find(params[:id])
        render json: preference
    end

    def create
    end

    def edit
    end

    def update
    end
end
