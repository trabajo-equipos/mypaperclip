class CreateHorarios < ActiveRecord::Migration
  def change
    create_table :horarios do |t|
      t.string :job_horario_no,:default => 1000
      t.string :deliver
      t.string :version
      t.string :onsite_review_close
      t.string :agency_review_close
      t.date :expected_deliver_date
      t.string :quote_values
      t.date :fecha
      t.time :hora
      t.string :aula
      t.references :materia
      t.references :curso
      t.references :instructor

      t.timestamps
    end
    add_index :horarios, :materia_id
    add_index :horarios, :curso_id
    add_index :horarios, :instructor_id
  end
end

