require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'AchsFes2015'" do
      visit '/static_pages/home'
      expect(page).to have_content('青商祭2015')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      expect(page).to have_title("青商祭2015")
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('このアプリについて')
    end

    it "should not have a custom page title" do
      visit '/static_pages/about'
      expect(page).not_to have_title("| About Us")
    end

  end

end