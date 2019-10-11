module AccountTransactionsHelper
  def max_tickets(event) 
      [event.tickets_remaining, ((current_user.account.amount)/(@event.tickets[0].price)).to_i].min
  end

end
