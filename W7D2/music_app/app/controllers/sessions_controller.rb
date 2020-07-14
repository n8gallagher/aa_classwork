class SessionsController < ApplicationController
    
    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user && @user.is_password?(params[:password])
            login!(@user)
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    def destroy
        if logged_in?
            logout!
        end
        redirect_to users_url
    end
end
