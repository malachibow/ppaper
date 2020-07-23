class CreateRreplies < ActiveRecord::Migration[6.0]
  def change
    create_table :rreplies do |t|
      t.references :reply, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
