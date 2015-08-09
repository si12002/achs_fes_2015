require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the h1 '青商祭2015'" do
      visit root_path
      expect(page).to have_content('青商祭2015')
    end

    it "should have the base title" do
      visit root_path
      expect(page).to have_title("青商祭2015")
    end

    it "should not have a custom page title" do
      visit root_path
      expect(page).not_to have_title('| Home')
    end
  end

  describe "About page" do

    it "should have the h1 'このアプリについて'" do
      visit about_path
      expect(page).to have_content('このアプリについて')
    end

    it "should have the title 'このアプリについて'" do
      visit about_path
      expect(page).to have_title("青商祭2015 | このアプリについて")
    end

  end

end