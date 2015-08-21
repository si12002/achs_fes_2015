class HomeroomsController < ApplicationController

def show
	@homeroom = Homeroom.find(params[:id])
	@posts = @homeroom.posts
end

end
