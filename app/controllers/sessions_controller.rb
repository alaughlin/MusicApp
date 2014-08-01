class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      signin!(@user)
      redirect_to user_url(@user)
    else
      #flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    session[:session_token] = nil
    redirect_to new_session_url
  end
end