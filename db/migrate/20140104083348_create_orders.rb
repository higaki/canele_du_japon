class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :bought_on
      t.integer :canele_id
      t.integer :count

      t.timestamps
    end
  end
end
