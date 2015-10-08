class HomeroomsController < ApplicationController
before_action :signed_in_user, only: [:create, :edit, :update, :destroy]
before_action :admin_user, only: [:new, :create]

def index
  @homerooms = Homeroom.order(:id).limit(6)
end

def show
	@homeroom = Homeroom.find(params[:id])
	@posts = @homeroom.posts
end

def new
  @homeroom = Homeroom.new
end

def create
  @user = User.find(current_user.id)
  @homeroom = Homeroom.create(homeroom_params)
  if @homeroom.save
    flash[:success] = "登録が完了しました。"
    if @homeroom.category == 1
      redirect_to disp_1rd_path
    elsif @homeroom.category == 2
      redirect_to disp_2rd_path
    elsif @homeroom.category == 3
      redirect_to disp_cul_path
    elsif @homeroom.category == 4
      redirect_to disp_pta_path
    elsif @homeroom.category == 5
      redirect_to homerooms_path
    else 
      redirect_to @user
    end
  else
    render 'new'
  end
end

def edit
  if current_user.role_id == 2
    @homeroom = Homeroom.find(current_user.homeroom_id)
  else
    @homeroom = Homeroom.find(params[:id])
  end
end

def update
  @user = User.find(current_user.id)
  if current_user.role_id == 2
    @homeroom = Homeroom.find(current_user.homeroom_id)
  else
    @homeroom = Homeroom.find(params[:id])
  end
	if @homeroom.update_attributes(homeroom_params)
    flash[:success] = "変更を保存しました。"
    if @homeroom.category == 1
      redirect_to disp_1rd_path
    elsif @homeroom.category == 2
      redirect_to disp_2rd_path
    elsif @homeroom.category == 3
      redirect_to disp_cul_path
    elsif @homeroom.category == 4
      redirect_to disp_pta_path
    elsif @homeroom.category == 5
      redirect_to homerooms_path
    else 
      redirect_to @user
    end
  else
  	render 'edit'
  end
end

private
  def homeroom_params
    params.require(:homeroom).permit(:shop_name, :content, :menu, :icon, :remove_icon, :category, :class_no)
  end

end
