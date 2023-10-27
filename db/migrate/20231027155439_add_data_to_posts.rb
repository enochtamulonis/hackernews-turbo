class AddDataToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :data, :text
  end
end
