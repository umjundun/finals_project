class CreateStatusApps < ActiveRecord::Migration[5.2]
  def change
    create_table :status_apps do |t|
      t.string :status
      t.text :request
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
