class RemovePublicFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :public
  end
end
