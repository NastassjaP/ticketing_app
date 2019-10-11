class Ticket < ApplicationRecord
  
  belongs_to :event
  belongs_to :user, :class_name => 'User', :foreign_key => 'purchaser_id', :validate => true, :optional => true

  validates :number, :event_id, :price, presence: true
  
  validates_uniqueness_of :number
  validates_length_of :number, is: 10  

  scope :upcoming_tickets, -> { Ticket.joins(:event).where("events.date >= ?", (Date.today + 7.days))}
  scope :past_tickets, -> { Ticket.joins(:event).where("events.date < ?", (Date.today + 7.days))}

  scope :marketplace_tickets, -> { Ticket.joins(:event).where("date >= ?", (Date.today+7.days)).where(on_resell: "true") }

end
