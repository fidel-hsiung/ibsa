FactoryBot.define do
  factory :good do
    category                     { 'Textile' }
    name                         { 'Rolls of Cotton' }
    source                       { 'Australia/Sydney' }
    destination                  { 'Australia/Perth' }
    sequence(:consignment_id)    { |n| "AS100#{n}AP" }
    entry_at                     { '11/01/2019 18:53' }
    exit_at                      { '12/01/2019 07:45' }
  end
end
