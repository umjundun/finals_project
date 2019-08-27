class AddPropertiesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :instagram, :string
    add_column :users, :linkedin, :string
    add_column :users, :bio, :string
    add_column :users, :github, :string
    add_column :users, :job_title, :string
    add_column :users, :photo, :string
    add_column :users, :hibernate, :boolean #default should be false

    add_column :users, :developer, :boolean, :default => true
    add_column :users, :admin, :boolean

    add_column :users, :contact_number, :string
    add_column :users, :contact_email, :string
    add_column :users, :interests, :string
    add_column :users, :experience, :string
    add_column :users, :skills, :string
    add_column :users, :group, :string, inclusion: { in: ["developer", "ngo", "admin"] }, :default => "developer"

    add_reference :users, :organization, index: true, foreign_key: true
  end
end
