class AddBeaconIDsToLocationPoints < ActiveRecord::Migration
  def change
    add_column :location_points, :beac1, :string
    add_column :location_points, :beac2, :string
    add_column :location_points, :beac3, :string
    remove_column :location_points, :storeID
  end
end
