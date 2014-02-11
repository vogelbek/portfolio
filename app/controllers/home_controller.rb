class HomeController < ApplicationController
  def index
    @posts = Post.all
    @projects = Project.all
  end
end
