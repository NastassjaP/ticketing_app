class EventsController < AuthenticatedController
    def index
        @events=Event.all
        @upcoming_events = @events.upcoming_events.order(date: :asc)
        @past_events = @events.past_events.order(date: :asc)
        authorize @events
    end

    def new
        @event = Event.new
        authorize @event
    end
    
    def create
        @event=Event.new(event_params)
        authorize @event
        if @event.save
            TicketService.new(@event, params[:event][:price],0,0).create_tickets
            redirect_to events_path
        else
            flash[:alert] = "Event could not be created"
            redirect_to new_event_path
        end
    end

    def show
        @event = Event.find(params[:id])
        authorize @event
    end
    
    private
    def event_params
        params.require(:event).permit(:price, :purchaser, :name, :num_tickets, :date, :category_id, :description).merge(creator: current_user).except(:price)
    end
end
