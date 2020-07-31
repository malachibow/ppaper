class AddReportToRreply < ActiveRecord::Migration[6.0]
  def change
    add_column :rreplies, :report, :boolean, :default => false
  end
end
