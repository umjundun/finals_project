class AddColumnToProjectFiles < ActiveRecord::Migration[5.2]
  def change
    add_column :project_files, :name, :string
    add_column :project_files, :format, :string
  end
end
