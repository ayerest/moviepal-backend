class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def create
        puts params
        User.create(username: params[:username], password: params[:password], city: params[:city], name: params[:name])
    end
end
