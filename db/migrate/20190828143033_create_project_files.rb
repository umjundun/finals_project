class CreateProjectFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :project_files do |t|
      t.string :file_url
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
