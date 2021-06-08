class AppController < ApplicationController
  def home
  end

  def blog
    @posts = Post.all
  end

  def post
  end
end
