module Comments
  class NestedCommentsController < ApplicationController
    def index
      @comment = Post.find(params[:comment_id])
    end
  end
end