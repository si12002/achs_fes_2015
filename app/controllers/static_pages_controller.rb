class StaticPagesController < ApplicationController
  before_action :have_account
  
  def home
    @posts = Post.order(:created_at).limit(3)
    #if post.point == nil
    #  @ranks = Post.all.sort_by{|post|-post.likes.count} 
    #else
      @ranks = Post.all.sort_by{|post|-post.point}
    #end
    if signed_in? && current_user.role_id !=3
      redirect_to current_user
    end
  end

  def rank
    @posts = Post.all
    # @ranks = Post.all.sort_by{|post|-post.likes.count} 
    @ranks = Post.all.sort_by{|post|-post.point}
  end

  def about
  end

  def disp_3rd
  end

  def disp_2rd
    @homerooms = Homeroom.find([11,12,13,14,15,16])
  end

  def disp_1rd
    @homerooms = Homeroom.find([21,22,23])
  end

  def disp_cul
    @homerooms = Homeroom.find([31,32,33,34,35,36])
  end

  def disp_pta
    @homerooms = Homeroom.find([41,42,43,44])
  end

  def stage
  end

  def map
  end
end
