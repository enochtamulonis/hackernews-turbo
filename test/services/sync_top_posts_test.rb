require 'minitest/autorun'
class SyncTopPostsTest < Minitest::Test
  def test_gets_the_10_newest_posts
    SyncTopPosts.new.call
    assert_equal(Post.where(post_type: "story").count, 10)
  end
end