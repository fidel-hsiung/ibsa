class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string :category, index: true
      t.string :name, index: true
      t.string :source, index: true
      t.string :destination, index: true
      t.string :consignment_id
      t.datetime :entry_at, index: true
      t.datetime :exit_at, index: true
      t.boolean :left_facility, default: false, index: true

      t.timestamps
    end
    add_index :goods, :consignment_id, unique: true
  end
end
