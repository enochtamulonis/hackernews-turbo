class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :hacker_news_id

      t.timestamps
    end
  end
end
