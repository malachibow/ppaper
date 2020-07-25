class AddPostToNotification < ActiveRecord::Migration[6.0]
  def change
    add_reference :notifications, :post, null: false, foreign_key: true
  end
end
