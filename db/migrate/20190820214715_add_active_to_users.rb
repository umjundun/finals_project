class AddActiveToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hibernate, :boolean #default should be false
  end
end
