class CreateRepresentatives < ActiveRecord::Migration[5.2]
  def change
    create_table :representatives do |t|
      t.references :user, foreign_key: true
      t.references :organization, foreign_key: true
      t.boolean :primary

      t.timestamps
    end
  end
end
