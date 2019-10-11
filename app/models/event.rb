class Event < ApplicationRecord
  
  belongs_to :category
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  has_many :tickets, dependent: :destroy

  validates :name, :num_tickets, :date, :category_id, :description, :creator_id, presence: true
  validates :name, uniqueness: true 


  
  scope :upcoming_events, -> { where("date >= ?", (Date.today+7.days)) }
  scope :past_events, -> { where("date < ?", (Date.today+7.days)) }
  scope :marketplace_events, -> { Event.joins(:tickets).where("date >= ?", (Date.today+7.days)).where("tickets.on_resell= ?", true) }

  
  def tickets_sold
    tickets.where(sold_originally: "true").and(tickets.where(on_resell: "false")).count
  end

  def tickets_remaining
    tickets.where(on_resell: "true").or(tickets.where(sold_originally: "false")).count
  end

  def tickets_on_resell
    tickets.where(on_resell: "true").count
  end

end

