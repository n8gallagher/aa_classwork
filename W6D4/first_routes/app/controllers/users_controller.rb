class UsersController < ApplicationController
    def index
        if !params[:query]
            users = User.all
            render json: users
        else
            user = User.find_by(username: params[:query])
            render json: user
        end
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def destroy
        user = User.find(params[:id])
        user.delete
        render json: user
    end

    private

    def user_params
        params.require(:users).permit(:username)
    end
end