class StagesController < ApplicationController
	before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]

	def index
		@stages1 = Stage.where('day = ?', 1)
		@stages2 = Stage.where('day = ?', 2)
	end

	def show
	end

	def new
		@stage = Stage.new
	end

	def create
		@stage = Stage.create(stage_params)
    	if @stage.save
      		flash[:success] = "投稿が完了しました。"
      		redirect_to '/stages'
    	else
      		render 'new'
    	end
	end

	def edit
		@stage = Stage.find(params[:id])
	end

	def update
		@stage = Stage.find(params[:id])
		if @stage.update_attributes(stage_params)
			flash[:success] = "変更を保存しました。"
			redirect_to '/stages'
		else
			render 'edit'
		end
	end

	def destroy
		@stage = Stage.find(params[:id])
		@stage.destroy
		flash[:success] = "削除しました。"
    	redirect_to '/stages'
	end

	private
    	def stage_params
      		params.require(:stage).permit(:name, :content, :day)
    	end

end

