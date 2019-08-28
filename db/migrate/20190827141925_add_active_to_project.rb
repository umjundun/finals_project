class AddActiveToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :active, :boolean, :default => true
end
end
