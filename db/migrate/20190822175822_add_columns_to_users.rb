class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :job_title, :string
    add_column :users, :contact_number, :string
    add_column :users, :contact_email, :string
    add_column :users, :interests, :string
    add_column :users, :experience, :string
    add_column :users, :skills, :string
  end
end
