class HomeroomsController < ApplicationController
before_action :signed_in_user, only: [:create, :edit, :update, :destroy]

def index
	@homerooms = Homeroom.find([1,2,3,4,5,6])
end

def show
	@homeroom = Homeroom.find(params[:id])
	#@user = User.find(params[:id])
	@posts = @homeroom.posts
end

def edit
	@homeroom = Homeroom.find(params[:id])
end

def update
	@homeroom = Homeroom.find(params[:id])
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
