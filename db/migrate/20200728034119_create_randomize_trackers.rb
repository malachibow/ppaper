class CreateRandomizeTrackers < ActiveRecord::Migration[6.0]
  def change
    create_table :randomize_trackers do |t|
      t.datetime :last_date

      t.timestamps
    end
  end
end
