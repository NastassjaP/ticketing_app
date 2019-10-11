class MarketplaceController < AuthenticatedController
  def index
    @tickets_on_sale = Ticket.marketplace_tickets.order(date: :asc)
    @marketplace_events = Event.marketplace_events.order(date: :asc)
  end

  def show
    @event = Event.find(params[:id])
    @tickets_on_sale = Ticket.marketplace_tickets.order(date: :asc)
  end

  def edit
    @ticket=Ticket.find(params[:ticket])
    if params[:type]=='resell'
        TicketService.new(0, 0, 0, @ticket).mark_ticket_as_on_resell
        redirect_to marketplace_path
    else
      @ticket=Ticket.find(params[:ticket])
      @user= User.find(@ticket.purchaser_id)
        #credit sellers account with money and record transaction
        AccountTransactionCreator.new(@user,  @ticket.price , 'market selling').account_transaction  
        AccountService.new(@user, @ticket.price).change_account_amount  

        TicketService.new(0, 0, current_user, @ticket).mark_ticket_as_resold
        
        #debit buyers account with money and record transaction
        AccountTransactionCreator.new(current_user,  -(@ticket.price).to_i , 'market selling').account_transaction  
        AccountService.new(current_user, -(@ticket.price).to_i).change_account_amount  
        redirect_to normal_path(current_user)

    end
  end
end