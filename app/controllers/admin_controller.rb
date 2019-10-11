class AdminController < AuthenticatedController

    def show
        @user = current_user
        authorize @user
    end

    def my_events_index
        authorize current_user
        @my_upcoming_events = current_user.events.upcoming_events
        @my_past_events = current_user.events.upcoming_events
    end
end
