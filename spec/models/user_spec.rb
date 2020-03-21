require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#full_name' do
    it 'should return full name' do
    	user = create(:user, first_name: 'Harry', last_name: 'Potter')
      expect(user.full_name).to eq 'Harry Potter'
    end
  end
end
