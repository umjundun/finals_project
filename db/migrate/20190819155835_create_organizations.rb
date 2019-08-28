class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :mission
      t.string :logo
      t.float :longitude, :float
      t.float :latitude, :float
      t.string :longitude, :address
      
      t.timestamps
    end
  end
end
