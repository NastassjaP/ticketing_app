class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :event, foreign_key: true
      t.boolean :sold_originally
      t.boolean :sold_on_marketplace
      t.boolean :on_resell
      t.integer :price
      t.references :purchaser, references: :users, foreign_key: { to_table: :users}
      t.integer :number
      t.timestamps
    end
  end
end
