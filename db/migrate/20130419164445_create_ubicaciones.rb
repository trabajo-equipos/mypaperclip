class CreateUbicaciones < ActiveRecord::Migration
  def change
    create_table :ubicaciones do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
