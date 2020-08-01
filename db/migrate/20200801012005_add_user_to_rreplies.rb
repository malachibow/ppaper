class AddUserToRreplies < ActiveRecord::Migration[6.0]
  def change
    add_reference :rreplies, :user, null: false, foreign_key: true
  end
end
