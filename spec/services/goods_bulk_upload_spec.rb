require 'rails_helper'

RSpec.describe GoodsBulkUpload do

  describe '#build' do
    it 'should return response' do
      expect(
        GoodsBulkUpload.new(csv: fixture_file_upload('/csvs/example-goods-csv.csv', 'text/csv')).build
      ).to eq ({result: true, total_count: 6, success_count: 5, failed_count: 1, failed_entries: [{row_num: '5', reason: "Source can't be blank"}]})
    end

    it 'should return response' do
      Good.create(category: 'Food', name: 'Coconuts', source: 'Australia/sydney', consignment_id: 'AS1001AA', entry_at: '11/01/2019 16:15')
      Good.create(category: 'Paper', name: 'Roll of Paper', source: 'Australia/Perth', destination: 'Australia/Sydney', consignment_id: 'AP1005AS', entry_at: '12/01/2019 07:45')
      Good.create(category: 'Liquid', name: 'Edible Oil (10L)', source: 'Australia/Adelaide', destination: 'Australia/Melbourne', consignment_id: 'AA1031AM', entry_at: '11/01/2019 18:53')
      Good.create(category: 'Wood', name: 'Wooden Boards 20"x20"', source: 'Australia/Perth', destination: 'Australia/Adelaide', consignment_id: 'AP1111AA', entry_at: '14/01/2019 07:45', exit_at: '16/01/2019 10:33', left_facility: true)
      expect(
        GoodsBulkUpload.new(csv: fixture_file_upload('/csvs/example-goods-csv.csv', 'text/csv')).build
      ).to eq ({
        result: true,
        total_count: 6,
        success_count: 2,
        failed_count: 4,
        failed_entries: [
          {row_num: '1', reason: 'This entry is not consitent with previous good, please check it!'},
          {row_num: '3', reason: 'Exit at can\'t be blank'},
          {row_num: '5', reason: 'Source can\'t be blank'},
          {row_num: '6', reason: 'This good has already left facility'}
        ]
      })
    end

    it 'should return response' do
      expect_any_instance_of(Good).to receive(:save).and_raise('debug')
      expect(
        GoodsBulkUpload.new(csv: fixture_file_upload('/csvs/example-goods-csv.csv', 'text/csv')).build
      ).to eq ({result: false, total_count: 'N/A', success_count: 0, failed_count: 0, failed_entries: []})
    end
  end
end

#  Example Goods CSV
#  ,Type,Name,Source,Destination,Consignment ID,Entry At,Exit At
#  1,Food,Coconuts,Australia/Sydney,Australia/Adelaide,AS1001AA,11/01/2019 16:15,12/01/2019 07:45
#  2,Liquid,Edible Oil (10L),Australia/Adelaide,Australia/Melbourne,AA1031AM,11/01/2019 18:53,12/01/2019 07:45
#  3,Paper,Roll of Paper,Australia/Perth,Australia/Sydney,AP1005AS,12/01/2019 07:45,
#  4,Textile,Rolls of Cotton,Australia/Melbourne,Australia/Perth,AM1101AP,14/01/2019 07:45,
#  5,Wood,Wooden Boards 20"x20",,Australia/Adelaide,AP1110AA,14/01/2019 07:45,16/01/2019 10:33
#  6,Wood,Wooden Boards 20"x20",Australia/Perth,Australia/Adelaide,AP1111AA,14/01/2019 07:45,16/01/2019 10:33