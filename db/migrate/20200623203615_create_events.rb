class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :location
      t.date :date
      t.text :description
      t.references :creator, index: true, foreign_key: {to_table: :user}

      t.timestamps
    end
  end
end
