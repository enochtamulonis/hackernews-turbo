class FetchPostCommentsJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    post = Post.find(post_id)
    FetchPostComments.new(post).call
  end
end
