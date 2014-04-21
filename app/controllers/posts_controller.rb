class PostsController < ApplicationController

  before_action :authenticate_admin!, except: [:index]
  before_action :set_post_policy, only: [:new, :create, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create params[:post].permit(:title, :body, (:published if @policy.publish?))

    if @post.save
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    @post.update_attributes params[:post].permit(:title, :body, (:published if @policy.publish?))

    if @post.save
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy

    redirect_to posts_path
  end

  private

  def set_post_policy
    @policy = PostHelper::PostPolicy.new current_admin
  end
end
