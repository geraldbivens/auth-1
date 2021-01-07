class UsersController < ApplicationController
    
    def index
        @users = User.all

        render json: @users
    end

    def show
        @user = User.find(params[:find])

        render json: @user
    end
    
    def create
        @user = User.create(
            username: params[:username],
            password: params[:password]
        )

        render json: @user, status: :created
    end
end
