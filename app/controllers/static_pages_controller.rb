class StaticPagesController < ApplicationController
  def home
    @posts = Post.order(:created_at).limit(3)
  end

  def about
  end

  def disp_3rd
  end

  def disp_2rd
  end

  def disp_1rd
  end

  def disp_cul
  end

  def disp_pta
  end

  def stage
  end

  def map
  end
end
