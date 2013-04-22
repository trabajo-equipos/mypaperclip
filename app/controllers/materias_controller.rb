class MateriasController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 2 
    end
   
    @materias = Materia.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:registro].to_i)
   

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @materias }
    end
  end
  def show
      @materia = Materia.find(params[:id])
      #@materia = Materia.find(params[:materia])
  end

  def new
      @materia = Materia.new
  end

  def edit
      @materia = Materia.find(params[:id])
  end

  def create
      @materia = Materia.new(params[:materia])
      render :action => :new unless @materia.save
      @materias = Materia.all
  end

  def update
      @materia = Materia.find(params[:id])
      render :action => :edit unless @materia.update_attributes(params[:materia])
  end

  def destroy
      @materia = Materia.find(params[:id])
      @materia.destroy
      @materias = Materia.all
  end


  private

  def sort_column

   Materia.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
    
  end

  def sort_direction 

    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    
  end
  
end
