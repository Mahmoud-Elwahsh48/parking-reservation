class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.date :starts
      t.date :ends
      t.integer :days
      t.integer :capacity
      t.float :parking_price
      t.float :discount

      t.timestamps
    end
  end
end
