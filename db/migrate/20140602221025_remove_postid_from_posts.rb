class RemovePostidFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :post_id, :string
  end
end
