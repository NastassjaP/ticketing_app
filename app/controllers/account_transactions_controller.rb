class AccountTransactionsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @amount = (-(params[:num_tickets].to_i*@event.tickets[0].price.to_i)).to_i
    AccountTransactionCreator.new(current_user, @amount , 'ticket purchase').account_transaction  
    AccountService.new(current_user, @amount).change_account_amount  
    params[:num_tickets].to_i.times do
      TicketService.new(@event, 0, current_user, 0).mark_ticket_as_sold
    end
    redirect_to normal_path(current_user)

  end

  private
    def account_transaction_params
      params.require(:num_tickets).permit(:num_tickets)
    end
end
