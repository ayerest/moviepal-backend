class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def create
        User.create(username: params[:username], password: params[:password])
    end
end
