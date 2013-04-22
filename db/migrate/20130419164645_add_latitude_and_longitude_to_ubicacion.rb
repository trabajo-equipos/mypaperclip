class AddLatitudeAndLongitudeToUbicacion < ActiveRecord::Migration
  
   def self.up
    add_column :ubicaciones, :latitude, :float
  end

  def self.down
    add_column :ubicaciones, :longitude, :float
  end
end
