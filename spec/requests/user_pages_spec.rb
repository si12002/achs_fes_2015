require 'spec_helper'

describe "User pages" do

  	subject { page }

	describe "profile page" do
    	let(:user) { FactoryGirl.create(:user) }
    	before { visit user_path(user) }

    	it { should have_content(user.name) }
    	it { should have_title(user.name) }
  	end

  	describe "with valid information" do
    	describe "after saving the user" do
    		before { click_link "ログイン" }
        	let(:user) { User.find_by(email: 'user@example.com') }

        	it { should have_link('ログアウト') }
        	it { should have_title(user.name) }
        	it { should have_selector('div.alert.alert-success', text: 'Welcome') }
    	end
    end
end