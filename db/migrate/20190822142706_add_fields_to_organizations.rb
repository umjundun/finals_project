class AddCoordinatesToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :ein, :string
    add_column :organizations, :address, :string
    add_column :organizations, :latitude, :float
    add_column :organizations, :longitude, :float
  end
end
