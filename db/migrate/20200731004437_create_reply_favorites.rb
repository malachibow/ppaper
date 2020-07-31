class CreateReplyFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :reply_favorites do |t|
      t.references :reply, null: false, foreign_key: true

      t.timestamps
    end
  end
end
