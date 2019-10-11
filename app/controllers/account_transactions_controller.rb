class AccountTransactionsController < ApplicationController
  include AccountTransactionsHelper
  def new
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @amount = (-(params[:num_tickets].to_i*@event.tickets[0].price.to_i)).to_i
    
    if max_tickets(@event) >= params[:num_tickets].to_i       
      AccountTransactionCreator.new(current_user, @amount , 'ticket purchase').account_transaction  
      TicketService.new(@event, 0, current_user, 0, params[:num_tickets].to_i).mark_tickets_as_sold
      flash[:alert] = "Ticket(s) bought"
      redirect_to normal_path(current_user)
    
    else
      if params[:num_tickets].to_i>@event.tickets_remaining
        flash[:alert] = "Not enough tickets left for this event"
      elsif -(@amount)>current_user.account.amount
        flash[:alert] = "Not enough money left in your account"
      end
      redirect_to new_event_account_transaction_path
    end
  end

  private
    def account_transaction_params
      params.require(:num_tickets).permit(:num_tickets)
    end
end
