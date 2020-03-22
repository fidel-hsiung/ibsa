# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: 'fidelhsiung@gmail.com', password: '12345678', first_name: 'Feifei', last_name: 'Xiong')


Good.create(category: 'Food', name: 'Coconuts', source: 'Australia/sydney', consignment_id: 'AS1001AA', entry_at: '11/01/2019 16:15')
Good.create(category: 'Paper', name: 'Roll of Paper', source: 'Australia/Perth', destination: 'Australia/Sydney', consignment_id: 'AP1005AS', entry_at: '12/01/2019 07:45')
Good.create(category: 'Liquid', name: 'Edible Oil (10L)', source: 'Australia/Adelaide', destination: 'Australia/Melbourne', consignment_id: 'AA1031AM', entry_at: '11/01/2019 18:53')
Good.create(category: 'Liquid', name: 'Coconut Water (1L)', source: 'Australia/Adelaide', destination: 'Australia/Melbourne', consignment_id: 'AA1021AM', entry_at: '11/01/2019 17:53')
Good.create(category: 'Liquid', name: 'Edible Oil (10L)', source: 'Australia/Adelaide', destination: 'Australia/Melbourne', consignment_id: 'AA1013AM', entry_at: '11/01/2019 18:33')
Good.create(category: 'Liquid', name: 'Coconut Water (1L)', source: 'Australia/Adelaide', destination: 'Australia/Melbourne', consignment_id: 'AA1014AM', entry_at: '11/01/2019 14:53')
Good.create(category: 'Liquid', name: 'Edible Oil (10L)', source: 'Australia/Adelaide', destination: 'Australia/Melbourne', consignment_id: 'AA1015AM', entry_at: '11/01/2019 12:53')
Good.create(category: 'Liquid', name: 'Coconut Water (1L)', source: 'Australia/Adelaide', destination: 'Australia/Melbourne', consignment_id: 'AA1016AM', entry_at: '12/01/2019 17:53')
Good.create(category: 'Liquid', name: 'Edible Oil (10L)', source: 'Australia/Adelaide', destination: 'Australia/Melbourne', consignment_id: 'AA1017AM', entry_at: '13/01/2019 18:53')
Good.create(category: 'Liquid', name: 'Coconut Water (1L)', source: 'Australia/Adelaide', destination: 'Australia/Melbourne', consignment_id: 'AA1018AM', entry_at: '11/01/2019 09:55')
Good.create(category: 'Liquid', name: 'Edible Oil (10L)', source: 'Australia/Adelaide', destination: 'Australia/Melbourne', consignment_id: 'AA1019AM', entry_at: '11/01/2019 11:23')
Good.create(category: 'Liquid', name: 'Coconut Water (1L)', source: 'Australia/Adelaide', destination: 'Australia/Melbourne', consignment_id: 'AA1020AM', entry_at: '12/01/2019 14:53')
Good.create(category: 'Wood', name: 'Wooden Boards 20"x20"', source: 'Australia/Perth', destination: 'Australia/Adelaide', consignment_id: 'AP1111AA', entry_at: '14/01/2019 07:45', exit_at: '16/01/2019 10:33', left_facility: true)