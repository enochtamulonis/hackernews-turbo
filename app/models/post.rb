class Post < ApplicationRecord
  serialize :data, JSON
  has_many :comments, class_name: "Post", foreign_key: "story_id"
  has_many :nested_comments, class_name: "Post", foreign_key: "comment_id"
  belongs_to :story, class_name: "Post", optional: true, foreign_key: "story_id"
  belongs_to :comment, class_name: "Post", optional: true, foreign_key: "comment_id"
  validates_uniqueness_of :hacker_news_id
end
