require 'spec_helper'

describe "Static pages" do

	subject{ page }

	describe "Home page" do
  		before{ visit root_path }

  		it{ should have_content('青商祭2015') }
  		it{ should have_title(full_title('')) }
  		it{ should_not have_title('| Home') }
	end

	describe "About page" do
  		before{ visit about_path }

  		it{ should have_content('このアプリについて') }
  		it{ should have_title(full_title("このアプリについて")) }
	end

	describe "Stage page" do
  		before{ visit stage_path }

  		it{ should have_content('ステージ発表') }
  		it{ should have_title(full_title("ステージ発表")) }
	end

	describe "Map page" do
  		before{ visit map_path }

  		it{ should have_content('校内マップ') }
  		it{ should have_title(full_title("校内マップ")) }
	end

end