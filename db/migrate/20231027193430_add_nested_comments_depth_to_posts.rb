class AddNestedCommentsDepthToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :nested_comments_depth, :integer, default: 0
  end
end
