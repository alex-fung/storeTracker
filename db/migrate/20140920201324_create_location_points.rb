class CreateLocationPoints < ActiveRecord::Migration
  def change
    create_table :location_points do |t|
    	t.decimal :dist1
    	t.decimal :dist2
    	t.decimal :dist3
  		t.datetime :timeSent
  		t.integer :storeID

      t.timestamps
    end
  end
end
