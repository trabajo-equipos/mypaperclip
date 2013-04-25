class ColegiosController < ApplicationController
  # GET /colegios
  # GET /colegios.json
  def index
    @colegios = Colegio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @colegios }
    end
  end

  def show
      @colegio = Colegio.find(params[:id])
      #@materia = Materia.find(params[:materia])
  end

  def new
      @colegio = Colegio.new
  end

  def edit
      @colegio = Colegio.find(params[:id])
  end

  def create
      @colegio = Colegio.new(params[:colegio])
      render :action => :new unless @colegio.save
      #@materias = Materia.all
  end

  def update
      @colegio = Colegio.find(params[:id])
      render :action => :edit unless @colegio.update_attributes(params[:colegio])
  end

  def destroy
      @colegio = Colegio.find(params[:id])
      @colegio.destroy
      #@materias = Materia.all
  end
  
end
