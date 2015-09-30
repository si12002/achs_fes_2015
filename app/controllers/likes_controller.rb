class LikesController < ApplicationController
  before_action :signed_in?

def create
	@like = Like.new(like_params)
	@c_like = current_user.likes.create!(post_id: @like.post_id)
	@post = Post.find(@like.post_id)
	redirect_to @c_like.post
end

def destroy
end

private
	def like_params
		params.require(:like).permit(:post_id, :user_id)
	end

end
