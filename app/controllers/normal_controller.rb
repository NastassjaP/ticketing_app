class NormalController < AuthenticatedController
  def show
    @user = current_user
    authorize @user
    @upcoming_tickets = @user.tickets.upcoming_tickets.order(date: :asc)
    @past_tickets = @user.tickets.past_tickets.order(date: :asc)
  end


end
