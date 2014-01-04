class CreateCaneles < ActiveRecord::Migration
  def change
    create_table :caneles do |t|
      t.string :name
      t.integer :price
      t.date :started_from
      t.date :discontinued_in

      t.timestamps
    end
  end
end
