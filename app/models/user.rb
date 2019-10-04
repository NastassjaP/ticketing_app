class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.user_types
    ['Admin', 'Normal']
  end

  validates :first_name, :last_name, :email, :type, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true

  validates_length_of :contact_number, is: 10

end
