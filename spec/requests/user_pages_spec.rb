require 'spec_helper'

describe "User pages" do

  	subject { page }

	describe "profile page" do
    	let(:user) { FactoryGirl.create(:user) }
    	before { visit user_path(user) }

    	it { should have_content(user.name) }
    	it { should have_title("マイページ") }
  	end

  	# describe "with valid information" do
    #	describe "after saving the user" do
    #		before { click_link "ログイン" }
    #   	let(:user) { User.find_by(email: 'user@example.com') }
    #
    #   	it { should have_link('ログアウト') }
    #   	it { should have_title(user.name) }
    #    	it { should have_selector('div.alert.alert-success', text: 'Welcome') }
    #	end
    # end

    describe "edit" do
        let(:user) { FactoryGirl.create(:user) }
        before do
            sign_in user
            visit edit_user_path(user)
        end

        describe "page" do
            it { should have_content("プロフィール変更") }
            it { should have_title("プロフィール変更") }
            it { should have_link('画像の変更', href: 'http://gravatar.com/emails') }
        end

        describe "with invalid information" do
            let(:new_name)  { "New Name" }
            let(:new_email) { "new@example.com" }
            before do
                fill_in "アカウント名", with: new_name
                fill_in "メールアドレス", with: new_email
                fill_in "パスワード", with: user.password
                fill_in "パスワード確認", with: user.password
                click_button "変更する"
            end

            it { should have_title("マイページ") }
            it { should have_selector('div.alert.alert-success') }
            it { should have_link('ログアウト', href: signout_path) }
            specify { expect(user.reload.name).to  eq new_name }
            specify { expect(user.reload.email).to eq new_email }
        end
    end
end