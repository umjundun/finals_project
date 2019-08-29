class AddColunmsToEngagements < ActiveRecord::Migration[5.2]
  def change
    add_column :engagements, :ngo_status, :string, :default => ""
    add_column :engagements, :dev_status, :string, :default => ""
    add_column :engagements, :start_date, :datetime
    add_column :engagements, :end_date, :datetime
  end
end
