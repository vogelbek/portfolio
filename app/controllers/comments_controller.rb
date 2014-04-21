class CommentController < ApplicationController

  private
  def set_commentable_object
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.constantize.find id
  end
end
