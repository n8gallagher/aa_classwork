class SessionsController < ApplicationController
  before_action :require_logged_out, only: [:new, :create]
  before_action :require_logged_in, only: [:destroy]

  def new
    render :new
  end
  def create
    @user = User.find_by_credentials(params[:username], params[:password]) #nil or a user
    if @user
        @user.reset_session_token!
        session[:session_token] = @user.session_token
        redirect_to cats_url
    else
        redirect_to new_session_url
    end
  end
  def destroy
    @current_user.reset_session_token! if @current_user
    session[:session_token] = nil
  end
end
