class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nombre
      t.string :ficha
      t.references :instructor

      t.timestamps
    end
    add_index :cursos, :instructor_id
  end
end
