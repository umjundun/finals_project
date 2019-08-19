class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :description
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
