require 'rails_helper'

RSpec.describe AccountTransaction, type: :model do
  
  it { should belong_to(:account) }

  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:account) }
  it { should validate_presence_of(:note) }

  it { should validate_inclusion_of(:note).in_array(['initialization', 'ticket purchase', 'market selling'])  }

end
