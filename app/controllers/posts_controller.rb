class PostsController < ApplicationController
	before_action :signed_in_user, only: [:new, :create, :destroy]
	before_action :correct_user,   only: :destroy

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

  	def edit
  		@post = Post.find(params[:id])
  	end

  	def update
  		@post = Post.find(params[:id])
  		if @post.update_attributes(post_params)
      		flash[:success] = "変更を保存しました。"
      		redirect_to @post
    	else
      		render 'edit'
    	end
  	end

	def destroy
		@post.destroy
    	redirect_to current_user
	end


	private
    	def post_params
      		params.require(:post).permit(:title, :content)
    	end

    	def correct_user
      		# @post = current_user.posts.find_by(id: params[:id])
      		@homeroom = Homeroom.find(current_user.id)
      		@post = @homeroom.posts.find_by(id: params[:id])
      		redirect_to current_user if @post.nil?
    	end

end
