class ChangeTypeToBeIntegerInNotifications < ActiveRecord::Migration[6.0]
  def change
    change_column :notifications, :type, :integer, using: 'type::integer'
  end
end
