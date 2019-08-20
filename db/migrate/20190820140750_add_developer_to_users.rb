class AddDeveloperToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :developer, :boolean
  end
end
