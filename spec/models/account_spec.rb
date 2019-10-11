require 'rails_helper'

RSpec.describe Account, type: :model do

  it { should belong_to(:user) }
  it { should have_many(:account_transactions).dependent(:destroy) }

  it { should validate_presence_of(:amount) }

  it { should validate_numericality_of(:amount)}
end
