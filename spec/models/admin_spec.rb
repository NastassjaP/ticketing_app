require 'rails_helper'

RSpec.describe Admin, type: :model do
  
  it { should have_many( :events ).dependent(:destroy)  }

end
