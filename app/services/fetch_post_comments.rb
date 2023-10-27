class FetchPostComments
  attr_reader :post
  def initialize(post)
    @post = post
  end

  def call
    @story = post.story
    post.data["kids"].each do |comment_id|
      if Post.find_by(hacker_news_id: comment_id).present?
        return
      end
      if post.data["type"] == "story"
        @comment = post.comments.create(hacker_news_id: comment_id)
      else
        @comment = post.nested_comments.create(hacker_news_id: comment_id, story: @story)
      end
      FetchPostData.new(@comment).call
      @comment.reload
      if @comment.data["kids"].present? && @comment.data["kids"]&.size&.positive?
        if post.post_type != "story"
          @story.update(nested_comments_depth: @story.nested_comments_depth + 1)
        end
      end
    end
  end
end