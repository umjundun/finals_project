class RenameColumnInProjects < ActiveRecord::Migration[5.2]
  def change
    change_table :projects do |t|
      t.rename :type, :category
    end
  end
end
