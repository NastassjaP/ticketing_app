class AddDefaultValueToTicketAttributes < ActiveRecord::Migration[5.2]
  def change
    change_column :tickets, :sold_originally, :boolean, default: false
    change_column :tickets, :sold_on_marketplace, :boolean, default: false
    change_column :tickets, :on_resell, :boolean, default: false
  end
end
