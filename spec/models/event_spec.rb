require 'rails_helper'

RSpec.describe Event, type: :model do
  
  it { should belong_to(:category) }
  it { should belong_to(:creator) }
  it { should have_many(:tickets).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:num_tickets) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:creator_id) }

  it { should validate_uniqueness_of(:name) }

end
