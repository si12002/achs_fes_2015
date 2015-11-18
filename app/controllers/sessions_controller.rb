class SessionsController < ApplicationController
  before_action :signed_in_at_form

# ログインページ
def new
end

# ログインする
def create
  user = User.find_by(email: params[:session][:email].downcase)
  if user && user.authenticate(params[:session][:password])
    sign_in user
    redirect_back_or user
  else
    flash.now[:error] = 'メールアドレスまたはパスワードが違います。'
    render 'new'
  end
end

# ログアウトする
def destroy
	sign_out
  redirect_to root_url
end

private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role_id)
    end

end