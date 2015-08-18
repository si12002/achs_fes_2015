require 'spec_helper'

describe "Authentication" do

	subject { page }

  	describe "signin page" do
    	before { visit signin_path }

    	it { should have_content('ログイン') }
    	it { should have_title('ログイン') }
  	end

  	describe "signin" do
    	before { visit signin_path }

    	describe "with invalid information" do
      		before { click_button "ログイン" }

      		it { should have_title('ログイン') }
      		it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    	end

    	describe "with valid information" do
      		let(:user) { FactoryGirl.create(:user) }
      		before do
        		fill_in "メールアドレス", with: user.email.upcase
        		fill_in "パスワード", with: user.password
        		click_button "ログイン"
      		end

      		it { should have_title(user.name) }
      		# it { should have_link('Profile', href: user_path(user)) }
      		it { should have_link('ログアウト', href: signout_path) }
      		it { should_not have_link('Sign in', href: signin_path) }
    	
    		describe "followed by signout" do
        		before { click_link "ログアウト" }
        		it { should have_link('ログイン') }
      		end
    	end
  	end
end