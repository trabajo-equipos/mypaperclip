class EstudiantesController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_filter :find_curso_estudiantes

  def index

      @estudiantes = @curso.estudiante.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(2)
      respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @estudiantes }
    end
  end

  def show
     
  end

  def new
      @estudiante =  Estudiante.new
  end

  def edit
     
  end

  def create
      @estudiante = @curso.estudiante.build(params[:estudiante])
      render :action => :new unless @estudiante.save
  end

  def update
    render :action => :edit unless @estudiante.update_attributes(params[:estudiante])
  end

  def destroy
    @estudiante.destroy
  end

  private

  def find_curso_estudiantes
     @curso = Curso.find(params[:curso_id])
     @estudiante = Estudiante.find(params[:id]) if params[:id]
  end


  private

  def sort_column

   Estudiante.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
    
  end

  def sort_direction 

    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    
  end
  
end