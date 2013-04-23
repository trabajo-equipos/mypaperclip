class Horario < ActiveRecord::Base
  attr_accessible :aula, :fecha, :hora, :materia_id, :curso_id, :instructor_id, :job_horario_no
  belongs_to :materia
  belongs_to :curso
  belongs_to :instructor

   
  def self.search(search)
		where('aula like ?', "%#{search}%")
	end
end
