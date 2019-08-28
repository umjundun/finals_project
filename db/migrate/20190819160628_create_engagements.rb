class CreateEngagements < ActiveRecord::Migration[5.2]
  def change
    create_table :engagements do |t|
      t.string :status, inclusion: { in: ["pending", "accepted", "rejected", "completed"] }, :default => "developer"
      t.text :request
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
