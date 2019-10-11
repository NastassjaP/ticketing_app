require 'rails_helper'

RSpec.describe Ticket, type: :model do
  
  it { should belong_to(:event) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:event_id) }
  it { should validate_presence_of(:price) }
  it { should validate_uniqueness_of(:number) }

  it { should validate_length_of(:number).is_equal_to(10) }
  
end
