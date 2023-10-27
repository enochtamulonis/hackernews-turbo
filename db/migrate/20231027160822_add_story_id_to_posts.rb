class AddStoryIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :story_id, :string
  end
end
