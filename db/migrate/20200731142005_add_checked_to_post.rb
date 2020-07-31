class AddCheckedToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :checked, :boolean, :default => false
  end
end
