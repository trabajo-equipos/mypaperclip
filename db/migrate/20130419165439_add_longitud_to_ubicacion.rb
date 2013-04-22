class AddLongitudToUbicacion < ActiveRecord::Migration
 def self.up
    add_column :ubicaciones, :longitude, :float
  end
end
