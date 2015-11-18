class LikesController < ApplicationController
  before_action :signed_in?

# Like(応援する)を作成する
def create
	@like = Like.new(like_params)
	@c_like = current_user.likes.create!(post_id: @like.post_id)
	@post = Post.find(@like.post_id)
	# 応援するボタンを押されたときのポイントの計算
	if @c_like.save
		@post.point = 1 + 1*@post.point
    	@post.update_attributes(point: @post.point)
	end
	redirect_to @c_like.post
end

def destroy
end

private
	def like_params
		params.require(:like).permit(:post_id, :user_id)
	end

end
