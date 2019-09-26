class ListsController < ApplicationController
    def index
        lists = List.all
        render :json lists
    end
    
    def show
        list = List.find(params[:id])
        render :json list
    end

    def new
    end

    def create
        console.log(params)
        debugger
    end

    def edit
    end

    def update
    end

    def destroy
    end
end
