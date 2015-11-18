class PostsController < ApplicationController
	before_action :shop_or_admin_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :have_account

  # 記事一覧
	def index
		@posts = Post.all.order('created_at DESC')
	end

  # 記事詳細
	def show
		@post = Post.find(params[:id])
		@homeroom = Homeroom.find(@post.homeroom_id)
	end

  # 再計算する
  # posts/recomputeでポイントを減らす計算をする
  def recompute
    @posts = Post.all
    @posts.each do |post|
      post.point = 0.944*post.point
      post.update_attributes(point: post.point)
    end
    render text: 'あああ'
  end

  # 投稿ページ
	def new
		@post = Post.new
		@user = User.find(current_user.id)
	end

  # 投稿
	def create
		@user = User.find(current_user.id)
    if current_user.role_id == 2
      @homeroom = Homeroom.find(@user.homeroom_id)
      @post = @homeroom.posts.build(post_params)
    else
      @post = Post.create(post_params)
    end
    if @post.save
      flash[:success] = "投稿が完了しました。"
      redirect_to @user
    else
    	render 'new'
    end
  end

  # 編集ページ
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

  # 削除
	def destroy
    @post = Post.find(params[:id])
		@post.destroy
    flash[:success] = "削除しました。"
    redirect_to current_user
	end


	private
    def post_params
  		params.require(:post).permit(:id, :title, :content, :image, :image_cache, :remove_image, :coupon, :c_content, :point, :homeroom_id)
    end

end
