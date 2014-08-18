class InitialWildlife < ActiveRecord::Migration
  def change

    create_table :animals do |t|
      t.string :name
    end

    create_table :sightings do |t|
      t.belongs_to :animal
      t.date :date
      t.decimal :lat
      t.decimal :long
    end
  end
end
