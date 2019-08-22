class AssignUsersToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :users, index: true
  end
end
