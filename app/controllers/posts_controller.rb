class PostsController < ApplicationController
	before_action :signed_in_user, only: [:new, :create, :destroy]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@homeroom = Homeroom.find(@post.homeroom_id)
	end

	def new
		@post = Post.new
		@user = User.find(current_user.id)
	end

	def create
		@user = User.find(current_user.id)
		@homeroom = Homeroom.find(current_user.id)
    	@post = @homeroom.posts.build(post_params)
    	if @post.save
      		flash[:success] = "投稿が完了しました。"
      		redirect_to @user
    	else
      		render 'new'
    	end
  	end

	def destroy
	end


	private
    	def post_params
      		params.require(:post).permit(:title, :content)
    	end

end
