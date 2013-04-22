class HorarioPdf < Prawn::Document
  def initialize(horario, view)
    super()
    @horario = horario
    @view = view
    logo
    deliver_details
    horario_details
  end
  def logo
    logopath =  "#{Rails.root}/app/assets/images/logo.png"
    image logopath, :width => 150, :height => 70
    move_down 10
    draw_text "Horario Detalles", :at => [220, 675], size: 22
  end
  def deliver_details
    move_down 60
    text "Horario Number:
   #{@horario.job_horario_no} ", :size => 13
    move_down 20
    text "Expected Delivey Date:
   #{@horario.expected_deliver_date} ", :size => 13
  end
  def horario_details    
    move_down 60
    horario_number = @horario.job_horario_no
    curso = @horario.curso.nombre if @horario.curso
    instructor = @horario.instructor.nombre if @horario.instructor
    materia = @horario.materia.nombre if @horario.materia
   
    table ([["Horario No",  "#{horario_number} "] ,
    ["Curso", "#{curso} "],
    ["Instructor", "#{instructor} "],
    ["Materia", "#{materia} "],
    ]),
  :width => 500 do
      columns(1).align = :center
      self.header = true
      self.column_widths = {0 => 200, 3 => 100}
      columns(2).font_style = :bold
    end
  end
end