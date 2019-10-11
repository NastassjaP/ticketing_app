class ChangeTicketNumberToString < ActiveRecord::Migration[5.2]
  def change
    change_column :tickets, :number, :string
  end
end
