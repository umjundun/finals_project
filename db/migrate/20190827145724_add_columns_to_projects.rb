class AddColumnsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :status, :boolean, :default => false
    add_column :projects, :type, :string
    add_column :projects, :deadline, :integer
  end
end
