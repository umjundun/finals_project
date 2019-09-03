class ChangeDevStatusDefaultInEngagements < ActiveRecord::Migration[5.2]
  def change
    change_column :engagements, :dev_status, :string, default: "Pending dev action"
  end
end
