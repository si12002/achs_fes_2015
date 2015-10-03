class StaticPagesController < ApplicationController
  before_action :have_account
  
  def home
    @posts = Post.order('created_at DESC').limit(3)
    @ranks = Post.order('point DESC')
    if signed_in? && current_user.role_id !=3
      redirect_to current_user
    end
  end

  def rank
    @posts = Post.all.order('created_at DESC')
    @ranks = Post.all.order('point DESC')
  end

  def about
  end

  def disp_3rd
  end

  def disp_2rd
    @homerooms = Homeroom.where('category = ?', 2)
  end

  def disp_1rd
    @homerooms = Homeroom.where('category = ?', 1)
  end

  def disp_cul
    @homerooms = Homeroom.where('category = ?', 3)
  end

  def disp_pta
    @homerooms = Homeroom.where('category = ?', 4)
  end

  def stage
  end

  def map
  end
end
