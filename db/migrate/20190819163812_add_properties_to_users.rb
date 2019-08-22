class AddPropertiesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :instagram, :string
    add_column :users, :linkedn, :string
    add_column :users, :bio, :string
    add_column :users, :github, :string
  end
end
