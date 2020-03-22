require 'rails_helper'

RSpec.describe GoodSearch do

  describe '#records' do
    it 'should return records' do
      good1 = Good.create(category: 'Food', name: 'Coconuts', source: 'Australia/sydney', consignment_id: 'AS1001AA', entry_at: '11/01/2019 16:15')
      good2 = Good.create(category: 'Paper', name: 'Roll of Paper', source: 'Australia/Perth', destination: 'Australia/Sydney', consignment_id: 'AP1005AS', entry_at: '12/01/2019 07:45')
      good3 = Good.create(category: 'Liquid', name: 'Edible Oil (10L)', source: 'Australia/Adelaide', destination: 'Australia/Melbourne', consignment_id: 'AA1031AM', entry_at: '11/01/2019 18:53')
      good4 = Good.create(category: 'Wood', name: 'Wooden Boards 20"x20"', source: 'Australia/Perth', destination: 'Australia/Adelaide', consignment_id: 'AP1111AA', entry_at: '14/01/2019 07:45', exit_at: '16/01/2019 10:33', left_facility: true)

      expect(GoodSearch.new(category: 'Paper').records).to eq [good2]
      expect(GoodSearch.new(name: 'Wooden').records).to eq [good4]
      expect(GoodSearch.new(source: 'Australia/Perth').records).to eq [good4, good2]
      expect(GoodSearch.new(destination: 'Australia/Melbourne').records).to eq [good3]
      expect(GoodSearch.new(consignment_id: 'AS1001AA').records).to eq [good1]
      expect(GoodSearch.new(entry_at_day: '11/01/2019').records).to eq [good3, good1]
      expect(GoodSearch.new(exit_at_day: '16/01/2019').records).to eq [good4]
      expect(GoodSearch.new(left_facility: 'true').records).to eq [good4]
    end
  end
end
