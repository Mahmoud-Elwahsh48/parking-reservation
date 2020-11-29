class AddOfferToVisitors < ActiveRecord::Migration[6.0]
  def change
    add_reference :offers, :visitor, foreign_key: true
  end
end
