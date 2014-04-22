class CommentsController < ApplicationController
  before_action :set_commentable_object
  def new
    @comment = @commentable.comments.new
  end
  def create
    @comment = @commentable.comments.create set_params
    redirect_to @commentable if @comment.save
  end
  private
  def set_params
    params.require(:comment).permit :tldr, :comment, :project_id
  end
  def set_commentable_object
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find id
  end
end
