class StaticPagesController < ApplicationController
  before_action :have_account
  
  # TOPページ
  def home
    @posts = Post.order('created_at DESC').limit(3)
    @ranks = Post.order('point DESC')
    if signed_in? && current_user.role_id !=3
      redirect_to current_user
    end
  end

  # アツいランキングページ
  def rank
    @posts = Post.all.order('created_at DESC')
    @ranks = Post.all.order('point DESC')
  end

  # このアプリについてページ
  def about
  end

  def disp_3rd
  end

  # 2学年展示ページ
  def disp_2rd
    @hw = Homeroom.where('category = ?', 2)
    @homerooms = @hw.order('class_no')
  end

  # 1学年展示ページ
  def disp_1rd
    @homerooms = Homeroom.where('category = ?', 1)
  end

  # 文化部展示ページ
  def disp_cul
    @homerooms = Homeroom.where('category = ?', 3)
  end

  # PTA展示ページ
  def disp_pta
    @homerooms = Homeroom.where('category = ?', 4)
  end

  def stage
  end

  def map
  end
end
