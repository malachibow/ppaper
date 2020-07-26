class AddReadToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :read_notification, :datetime
  end
end
