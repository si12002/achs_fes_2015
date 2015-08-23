class HomeroomsController < ApplicationController
before_action :signed_in_user, only: [:create, :destroy]

def index
	@homerooms = Homeroom.all
end

def show
	@homeroom = Homeroom.find(params[:id])
	@posts = @homeroom.posts
end

end
