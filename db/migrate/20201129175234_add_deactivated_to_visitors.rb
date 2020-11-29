class AddDeactivatedToVisitors < ActiveRecord::Migration[6.0]
  def change
    add_column :visitors, :deactivated, :boolean
  end
end
