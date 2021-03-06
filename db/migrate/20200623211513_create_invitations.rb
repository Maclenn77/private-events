class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :guests, index: true, foreign_key: { to_table: :users }
      t.references :event, index: true, foreign_key: true
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
