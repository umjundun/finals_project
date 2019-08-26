class AddGroupToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :group, :string, inclusion: { in: ["developer", "ngo", "admin"] }, :default => "developer"
  end
end
