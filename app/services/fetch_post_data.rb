require 'net/http'

class FetchPostData
  attr_reader :post, :success, :error

  def initialize(post) 
    @post = post
    @success = false
  end

  def call
    ActiveRecord::Base.connection_pool.with_connection do
      make_request
    end
  end

  def make_request
    begin
      url = API_BASE_URL + "/item/#{post.hacker_news_id}.json"
      uri = URI(url)
      response = Net::HTTP.get_response(uri)
      if response.is_a? Net::HTTPOK
        post_data = JSON.parse(response.body)
        post.update(data: post_data)
        if post_data["kids"].present?
          FetchPostCommentsJob.perform_later(post.id)
        end
        @success = true
      end
    rescue => error
      @error = error
    end
  end
end