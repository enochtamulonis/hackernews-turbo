require 'sidekiq-scheduler'

class SyncTopPostsJob < ApplicationJob
  queue_as :default

  def perform
    SyncTopPosts.new.call
  end
end
