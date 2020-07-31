class CreateRreplyFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :rreply_favorites do |t|
      t.references :rreply, null: false, foreign_key: true

      t.timestamps
    end
  end
end
