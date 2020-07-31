class AddUserToReplyFavorite < ActiveRecord::Migration[6.0]
  def change
    add_reference :reply_favorites, :user, null: false, foreign_key: true
  end
end
