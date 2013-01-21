class Aircraft < ActiveRecord::Base
  attr_accessible :aircraft_type, :iata_code, :manufacturer, :metadata_json, :name
end
