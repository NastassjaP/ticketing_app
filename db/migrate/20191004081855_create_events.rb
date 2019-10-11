class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :num_tickets
      t.date :date
      t.references :category, foreign_key: true
      t.text :description
      t.references :creator, references: :users, foreign_key: { to_table: :users}
      t.timestamps
    end
  end
end
