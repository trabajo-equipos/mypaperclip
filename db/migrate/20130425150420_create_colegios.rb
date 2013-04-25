class CreateColegios < ActiveRecord::Migration
  def change
    create_table :colegios do |t|
      t.string :nombre
      t.string :direccion
      t.string :telefono

      t.timestamps
    end
  end
end
