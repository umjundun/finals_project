class RenameColumnInUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.rename :linkedn, :linkedin
    end
  end
end
