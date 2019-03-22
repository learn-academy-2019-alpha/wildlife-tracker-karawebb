class CreateSightings < ActiveRecord::Migration[5.2]
  def change
    create_table :sightings do |t|
      t.bigint :animal_id, index: true
      t.date :date
      t.time :time
      t.string :latitude
      t.string :longitude
      t.timestamps
    end
  end
end
