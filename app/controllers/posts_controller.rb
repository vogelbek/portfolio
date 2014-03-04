class PostsController < ApplicationController
  before_action :authenticate_admin!, except: [:index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create params[:post].permit(:title, :body, (:published if current_admin.role == 'editor'))

    if @post.save
      redirect_to posts_path
    else
      redirect_to posts_new_path
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    @post.update_attributes params[:post].permit(:title, :body, (:published if current_admin.role == 'editor'))

    if @post.save
      redirect_to posts_path
    else
      redirect_to posts_new_path
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy

    redirect_to posts_path
  end
end
