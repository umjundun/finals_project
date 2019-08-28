class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :mission
      t.string :logo
      t.float :longitude
      t.float :latitude
      t.string :address

      t.timestamps
    end
  end
end
