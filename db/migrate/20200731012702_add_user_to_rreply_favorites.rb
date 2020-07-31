class AddUserToRreplyFavorites < ActiveRecord::Migration[6.0]
  def change
    add_reference :rreply_favorites, :user, null: false, foreign_key: true
  end
end
