class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
    if @user.role_id != 1
      @homeroom = Homeroom.find(params[:id])
      @posts = @homeroom.posts
    end
  end

  def new
  end

  def edit
    @homeroom = Homeroom.find(params[:id])
  end

  def update
    @homeroom = Homeroom.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "変更を保存しました。"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end