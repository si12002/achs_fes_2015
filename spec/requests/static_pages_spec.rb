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

	describe "Disp_3rd page" do
  		before{ visit disp_3rd_path }

  		it{ should have_content('3学年模擬店') }
  		it{ should have_title(full_title("3学年模擬店")) }
	end

	describe "Disp_2rd page" do
  		before{ visit disp_2rd_path }

  		it{ should have_content('2学年展示') }
  		it{ should have_title(full_title("2学年展示")) }
	end

	describe "Disp_1rd page" do
  		before{ visit disp_1rd_path }

  		it{ should have_content('1学年展示') }
  		it{ should have_title(full_title("1学年展示")) }
	end

	describe "Disp_cul page" do
  		before{ visit disp_cul_path }

  		it{ should have_content('文化部展示') }
  		it{ should have_title(full_title("文化部展示")) }
	end

	describe "Disp_pta page" do
  		before{ visit disp_pta_path }

  		it{ should have_content('PTA') }
  		it{ should have_title(full_title("PTA")) }
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