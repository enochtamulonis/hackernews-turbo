class FetchPostDataJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    post = Post.find(post_id)
    FetchPostData.new(post).call
  end
end
