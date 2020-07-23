class AddReportToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :report, :boolean
  end
end
