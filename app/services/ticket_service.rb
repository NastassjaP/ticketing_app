class TicketService
    def initialize(event, price, user, ticket, num_tickets)
      @event = event
      @price = price
      @user = user
      @ticket = ticket
      @num_tickets = num_tickets
    end
  
    def create_tickets
        @num_tickets.times do
            random = (0...10).map { [*'0'..'9', *'a'..'z'].sample }.join
            @ticket=Ticket.create(event_id: @event.id, price: @price, number: random)
        end
    end

    def mark_tickets_as_sold
        @num_tickets.to_i.times do
            @ticket = Ticket.where(event_id: @event.id, sold_originally: "false" )[0]
            @ticket.update(sold_originally: "true", purchaser_id: @user.id )
        end
    end
    
    def mark_ticket_as_resold
        @ticket.update(sold_on_marketplace: "true", on_resell: "false", purchaser_id: @user.id )
    end

    def mark_ticket_as_on_resell
        @ticket.update(on_resell: "true")
    end
end