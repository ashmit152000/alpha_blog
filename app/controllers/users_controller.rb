class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    @user.save
    if @user.save 
      redirect_to :articles
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  private 
  def users_params
    params.require(:user).permit(:username,:email,:password)
  end
end
