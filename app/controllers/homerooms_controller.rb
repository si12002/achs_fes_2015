class HomeroomsController < ApplicationController
before_action :signed_in_user, only: [:create, :edit, :update, :destroy]

def index
  @homerooms = Homeroom.order(:id).limit(6)
end

def show
	@homeroom = Homeroom.find(params[:id])
	@posts = @homeroom.posts
end

def edit
  if current_user.role_id == 2
    @homeroom = Homeroom.find(current_user.homeroom_id)
  else
    @homeroom = Homeroom.find(params[:id])
  end
end

def update
  if current_user.role_id == 2
    @homeroom = Homeroom.find(current_user.homeroom_id)
  else
    @homeroom = Homeroom.find(params[:id])
  end
	if @homeroom.update_attributes(homeroom_params)
    flash[:success] = "変更を保存しました。"
    redirect_to current_user
  else
  	render 'edit'
  end
end

private
  def homeroom_params
    params.require(:homeroom).permit(:shop_name, :content, :menu, :icon, :remove_icon)
  end

end
