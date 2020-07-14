class SessionsController < ApplicationController
    
    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:email], params[:password])
        if @user && @user.is_password?(params[:password])
            login!(@user)
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    def destroy
        @user = User.find_by(session_token: session[:session_token])
        logout!(@user)
        redirect_to users_url
    end
end
