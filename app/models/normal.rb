class Normal < User

  has_many :tickets, :foreign_key => 'purchaser_id'
  has_one :account, :foreign_key => 'user_id', dependent: :destroy
  
end
