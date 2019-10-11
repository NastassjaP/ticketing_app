class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_create :create_account_and_initial_transaction
  def self.user_types
    ['Admin', 'Normal']
  end


  validates :first_name, :last_name, :email, :type, :password, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true


  def create_account_and_initial_transaction
    @user = User.last
    if @user.type == "Normal"
      AccountService.new(@user, 0).create_account
      AccountTransactionCreator.new(@user, '100.00', 'initialization').account_transaction
    end
  end
  
end
