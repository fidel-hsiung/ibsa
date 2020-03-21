require 'rails_helper'

RSpec.describe Good, type: :model do
  
  before do
  	@good = create(:good)
  end

  describe '#entry_at_aus' do
    it 'should return time string' do
      expect(@good.entry_at_aus).to eq @good.entry_at.to_s(:time)
    end
  end

  describe '#exit_at_aus' do
    it 'should return time string' do
      expect(@good.exit_at_aus).to eq @good.exit_at.to_s(:time)
    end

    it 'should return nil' do
    	good = create(:good, exit_at: '')
      expect(good.exit_at_aus).to be_nil
    end
  end

  describe '#time_valid?' do
  	it 'should be invalid if exit_at before entry_at' do
	  	good = Good.new(FactoryBot.attributes_for(:good, entry_at: '12/01/2019 07:45', exit_at: '11/01/2019 18:53'))
	  	expect(good.valid?).to eq false
	  	expect(good.errors[:exit_at]).to eq ['cannot before entry at.']
	  end
  end


end
