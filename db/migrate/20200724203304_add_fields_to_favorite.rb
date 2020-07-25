class AddFieldsToFavorite < ActiveRecord::Migration[6.0]
  def change
    add_column :favorites, :content, :text
    add_column :favorites, :type, :integer
  end
end
