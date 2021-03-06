class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]
  before_action :current_user_only, only: [:edit, :update]
  def new
    @user = User.new
  end



  def create
    @user = User.new(users_params)
    @user.save
    
    if @user.save 
      session[:user_id] = @user.id
      flash[:success] = "You are successfully signed up"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    
    @made_articles = @user.articles.paginate(page: params[:page], per_page: 5)

  end

  def edit
    
  end

  def update
    
    if @user.update(users_params)
         flash[:success] = "Your profile was successfully updated"
        redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  private 
  def users_params
    params.require(:user).permit(:username,:email,:password)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def current_user_only
      if current_user != @user 
        flash[:danger] = "You can only edit your profile"
        redirect_to user_path(@user)
    end
  end
end
