class CursosController < ApplicationController

    helper_method :sort_column, :sort_direction
    before_filter :find_curso, :except => [ :index, :create, :new ]

  def index
      
      @cursos = Curso.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(2)
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cursos }
      
    end
  end

  def show
   
  end

  def new
      @curso = Curso.new
  end

  def edit
      
  end

  def create

      @curso = Curso.new(params[:curso])
      render :action => :new unless @curso.save
  end

  def update
      
      render :action => :edit unless @curso.update_attributes(params[:curso])
  end

  def destroy
    
      @curso.destroy
  end

  private

  def find_curso
      @curso = Curso.find(params[:id]) if params[:id]
  end


  private

  def sort_column

   Curso.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
    
  end

  def sort_direction 

    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    
  end
  
end