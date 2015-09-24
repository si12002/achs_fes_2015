class LikesController < ApplicationController
  before_action :signed_in?

def create
	@like = Like.create(like_params)
	redirect_to @like.post
end

def destroy
end

private
	def like_params
		params.require(:like).permit(:post_id, :user_id)
	end

end
