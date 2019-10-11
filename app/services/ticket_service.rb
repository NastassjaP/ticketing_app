class TicketService
    def initialize(event, price, user, ticket)
      @event = event
      @price = price
      @user = user
      @ticket = ticket
    end
  
    def create_tickets
        @event.num_tickets.times do
            random = (0...10).map { [*'0'..'9', *'a'..'z'].sample }.join
            @ticket=Ticket.create(event_id: @event.id, price: @price, number: random)
        end
    end

    def mark_ticket_as_sold
        @ticket = Ticket.where(event_id: @event.id, sold_originally: "false" )[0]
        @ticket.update(sold_originally: "true", purchaser_id: @user.id )
    end
    
    def mark_ticket_as_resold
        @ticket.update(sold_on_marketplace: "true", on_resell: "false", purchaser_id: @user.id )
    end

    def mark_ticket_as_on_resell
        @ticket.update(on_resell: "true")
    end
end