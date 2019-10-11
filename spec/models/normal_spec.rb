require 'rails_helper'

RSpec.describe Normal, type: :model do

    it { should have_many( :tickets ) }
    it { should have_one( :account ).dependent(:destroy) }

end
