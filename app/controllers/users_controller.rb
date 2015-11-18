class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :edit, :update]
  before_action :correct_user,   only: [:show, :edit, :update]

  # ユーザー一覧
  def index
  	@users = User.order(:id).limit(41)
  end

  # ユーザーマイページ
  def show
    @user = User.find(params[:id])
    if @user.role_id == 2
      @homeroom = Homeroom.find(@user.homeroom_id)
      @posts = @homeroom.posts
    end
  end

  def new
  end

  # ユーザー情報編集ページ
  def edit
    @homeroom = Homeroom.find(@user.homeroom_id)
  end

  # 更新
  def update
    @homeroom = Homeroom.find(@user.homeroom_id)
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