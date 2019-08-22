class UserBelongsToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_reference :organizations, :user, index: true, foreign_key: true
  end
end
