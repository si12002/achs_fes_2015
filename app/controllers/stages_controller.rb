class StagesController < ApplicationController
before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]
	
	# ステージ発表ページ
	def index
		@stages11 = Stage.where('day = ? and category = ?', 1, 1)
		@stages12 = Stage.where('day = ? and category = ?', 1, 2)
		@stages13 = Stage.where('day = ? and category = ?', 1, 3)
		@stages14 = Stage.where('day = ? and category = ?', 1, 4)
		@stages21 = Stage.where('day = ? and category = ?', 2, 1)
		@stages22 = Stage.where('day = ? and category = ?', 2, 2)
		@stages23 = Stage.where('day = ? and category = ?', 2, 3)
		@stages24 = Stage.where('day = ? and category = ?', 2, 4)
	end

	def show
	end

	# ステージ発表追加ページ
	def new
		@stage = Stage.new
	end

	# 追加
	def create
		@stage = Stage.create(stage_params)
    	if @stage.save
      		flash[:success] = "投稿が完了しました。"
      		redirect_to '/stages'
    	else
      		render 'new'
    	end
	end

	# ステージ発表編集ページ
	def edit
		@stage = Stage.find(params[:id])
	end

	# 編集
	def update
		@stage = Stage.find(params[:id])
		if @stage.update_attributes(stage_params)
			flash[:success] = "変更を保存しました。"
			redirect_to '/stages'
		else
			render 'edit'
		end
	end

	# 削除
	def destroy
		@stage = Stage.find(params[:id])
		@stage.destroy
		flash[:success] = "削除しました。"
    	redirect_to '/stages'
	end

	private
    	def stage_params
      		params.require(:stage).permit(:name, :content, :day, :category)
    	end

end

