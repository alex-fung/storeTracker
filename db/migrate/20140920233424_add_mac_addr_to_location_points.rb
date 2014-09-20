class AddMacAddrToLocationPoints < ActiveRecord::Migration
  def change
    add_column :location_points, :macAddr, :string
  end
end
