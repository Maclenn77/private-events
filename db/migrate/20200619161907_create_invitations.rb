class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :user, foreign_key: true, null: false
      t.references :event, foreign_key: true, null: false
      t.integer :creator
      t.boolean :attendance, default: false

      t.timestamps
    end
  end
end
