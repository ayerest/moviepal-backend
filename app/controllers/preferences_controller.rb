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
        user = params[:user]
        # notification = Notification.create()
        pref = Preference.create(user_id: user["id"], strength: 9)
        pref.delay.send_sms(user)
        # byebug
        # render :json => user
    end

    def edit
    end

    def update
    end
end
