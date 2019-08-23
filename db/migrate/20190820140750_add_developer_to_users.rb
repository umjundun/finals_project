class AddDeveloperToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :developer, :boolean, :default => true
  end
end
