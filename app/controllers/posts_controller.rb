class PostsController < ApplicationController
  def index
    @posts = Post.where(post_type: "story")
  end
end