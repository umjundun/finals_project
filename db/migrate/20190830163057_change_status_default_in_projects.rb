class ChangeStatusDefaultInProjects < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :status, :string, default: "Active"
  end
end
