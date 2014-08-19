class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.timestamps
    end
    change_table :sightings do |t|
      t.belongs_to  :region
    end
  end
end
