class GoodsBulkUpload
  require 'csv'

  include ActiveModel::Model
  attr_accessor :csv

  def build
    success_count = 0
    failed_count = 0
    failed_entries = []
    begin
      ActiveRecord::Base.transaction do
        CSV.foreach(csv.path, {headers: :first_row, liberal_parsing: true}) do |row|
          row = row[0].split(';') if row.size == 1
          temp_category = row[1].to_s.strip
          temp_name = row[2].to_s.strip
          temp_source = row[3].to_s.strip
          temp_destination = row[4].to_s.strip
          temp_consignment_id = row[5].to_s.strip
          temp_entry_at = row[6].to_s.strip
          temp_exit_at = row[7].to_s.strip
          if (temp_good = Good.find_by(consignment_id: temp_consignment_id))
            if temp_good.left_facility?
              failed_count += 1
              failed_entries.push({row_num: row[0], reason: 'This good has already left facility'})
              next
            end

            if temp_good.category != temp_category || temp_good.name != temp_name || temp_good.source != temp_source || temp_good.entry_at_aus != temp_entry_at
              failed_count += 1
              failed_entries.push({row_num: row[0], reason: 'This entry is not consitent with previous good, please check it!'})
              next
            end

            if temp_good.update(destination: temp_destination, exit_at: temp_exit_at, left_facility: true)
              success_count += 1
            else
              failed_count += 1
              failed_entries.push({row_num: row[0], reason: temp_good.errors.full_messages.join(', ')})
            end
            next
          end

          good = Good.new(category: temp_category, name: temp_name, source: temp_source, destination: temp_destination, consignment_id: temp_consignment_id, entry_at: temp_entry_at)
          if good.save
            success_count += 1
          else
            failed_count += 1
            failed_entries.push({row_num: row[0], reason: good.errors.full_messages.join(', ')})
          end
        end
      end
      {result: true, total_count: success_count + failed_count, success_count: success_count, failed_count: failed_count, failed_entries: failed_entries}
    rescue StandardError => e
      {result: false, total_count: 'N/A', success_count: 0, failed_count: 0, failed_entries: []}
    end
  end
  
end
