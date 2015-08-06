require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'AchsFes2015'" do
      visit '/static_pages/home'
      expect(page).to have_content('AchsFes2015')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("AchsFes2015 | Home")
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end

    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_title("AchsFes2015 | About Us")
    end

  end

end