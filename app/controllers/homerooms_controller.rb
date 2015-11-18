class HomeroomsController < ApplicationController
before_action :signed_in_user, only: [:create, :edit, :update, :destroy]
before_action :admin_user, only: [:new, :create]

# 模擬店一覧ページ
def index
  @homerooms = Homeroom.order(:id).limit(6) # id順に6つ表示する
end

# 模擬店詳細ページ
def show
	@homeroom = Homeroom.find(params[:id]) # idがparams[:id]の出展者
	@posts = @homeroom.posts # idがparams[:id]の出展者の記事を持ってくる
end

# 出展者追加ページ(3年以外の展示もHomeroomに追加)
def new
  @homeroom = Homeroom.new
end

# 追加
def create
  @user = User.find(current_user.id) # 現在のユーザーidのユーザーをさがす
  @homeroom = Homeroom.create(homeroom_params)
  if @homeroom.save
    flash[:success] = "登録が完了しました。"
    if @homeroom.category == 1
      redirect_to disp_1rd_path
    elsif @homeroom.category == 2
      redirect_to disp_2rd_path
    elsif @homeroom.category == 3
      redirect_to disp_cul_path
    elsif @homeroom.category == 4
      redirect_to disp_pta_path
    elsif @homeroom.category == 5
      redirect_to homerooms_path
    else 
      redirect_to @user
    end
  else
    render 'new'
  end
end

# お店情報編集ページ
def edit
  if current_user.role_id == 2
    @homeroom = Homeroom.find(current_user.homeroom_id)
  else
    @homeroom = Homeroom.find(params[:id])
  end
end

# 更新
def update
  @user = User.find(current_user.id)
  if current_user.role_id == 2
    @homeroom = Homeroom.find(current_user.homeroom_id)
  else
    @homeroom = Homeroom.find(params[:id])
  end
	if @homeroom.update_attributes(homeroom_params)
    flash[:success] = "変更を保存しました。"
    if @homeroom.category == 1
      redirect_to disp_1rd_path
    elsif @homeroom.category == 2
      redirect_to disp_2rd_path
    elsif @homeroom.category == 3
      redirect_to disp_cul_path
    elsif @homeroom.category == 4
      redirect_to disp_pta_path
    elsif @homeroom.category == 5
      redirect_to homerooms_path
    else 
      redirect_to @user
    end
  else
  	render 'edit'
  end
end

private
  def homeroom_params
    params.require(:homeroom).permit(:shop_name, :content, :menu, :icon, :remove_icon, :category, :class_no)
  end

end
