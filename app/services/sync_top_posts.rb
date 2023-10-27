require 'net/http'

class SyncTopPosts
  NEW_STORIES_URL = API_BASE_URL + "/topstories.json"

  def initialize
  end

  def call
    Post.destroy_all
    uri = URI(NEW_STORIES_URL)
    response = Net::HTTP.get_response(uri)
    if response.is_a? Net::HTTPOK
      post_ids = JSON.parse(response.body)
      post_ids.first(10).each do |hacker_news_id|
        post = Post.create(hacker_news_id: hacker_news_id, post_type: "story")
        FetchPostDataJob.perform_later(post.id)
      end
    end
  end
end