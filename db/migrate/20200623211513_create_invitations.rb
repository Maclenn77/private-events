class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :guests, index: true, foreign_key: { to_table: :user }
      t.references :events, index: true, foreign_key: true

      t.timestamps
    end
  end
end
