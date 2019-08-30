class ChangeStatusColumnInProjects < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :status, :string
  end
end
