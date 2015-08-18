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

      		it { should have_title("マイページ") }
          # it { should have_link('模擬店一覧', href: users_path) }
      		# it { should have_link('マイページ', href: user_path(user)) }
      		it { should have_link('プロフィール編集', href: edit_user_path(user)) }
          it { should have_link('ログアウト', href: signout_path) }
      		it { should_not have_link('ログイン', href: signin_path) }
    	
    		describe "followed by signout" do
        		before { click_link "ログアウト" }
        		it { should have_link('ログイン') }
      		end
    	end
  	end

    describe "authorization" do
      describe "for non-signed-in users" do
        let(:user) { FactoryGirl.create(:user) }

        describe "in the Users controller" do
          describe "visiting the edit page" do
            before { visit edit_user_path(user) }
            it { should have_title('ログイン') }
          end

          describe "visiting the user index" do
            before { visit users_path }
            it { should have_title('ログイン') }
          end

          describe "submitting to the update action" do
            before { patch user_path(user) }
            specify { expect(response).to redirect_to(signin_path) }
          end
        end
      end
    end
end