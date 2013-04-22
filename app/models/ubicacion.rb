class Ubicacion < ActiveRecord::Base
   attr_accessible :address, :latitude, :longitude,:nombre
   geocoded_by :nombre
    after_validation :geocode
end
