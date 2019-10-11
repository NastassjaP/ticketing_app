class AccountTransaction < ApplicationRecord
  
  belongs_to :account
  validates :amount, :account, :note, presence: true
  validates :note, inclusion: { in: ["initialization", "ticket purchase", "market selling"] }

end


