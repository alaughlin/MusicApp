class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:messages] = "Account created for #{@user.email}!"
      # login should happen immediately
      signin!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def update

  end

  def destroy

  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end