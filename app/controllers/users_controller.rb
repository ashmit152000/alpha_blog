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
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(users_params)
         flash[:success] = "Your profile was successfully updated"
        redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private 
  def users_params
    params.require(:user).permit(:username,:email,:password)
  end
end
