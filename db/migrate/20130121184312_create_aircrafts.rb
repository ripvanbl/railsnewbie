class CreateAircrafts < ActiveRecord::Migration
  def change
    create_table :aircrafts do |t|
      t.string :aircraft_type
      t.string :iata_code
      t.string :manufacturer
      t.string :name
      t.text :metadata_json

      t.timestamps
    end
  end
end
