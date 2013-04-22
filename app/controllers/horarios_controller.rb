class HorariosController < ApplicationController
  require 'prawn'

  helper_method :sort_column, :sort_direction

  def index
    
     @horarios = Horario.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(2)

     respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @horarios }
    end
  
  end
  
  def show
      #@horario = Horario.find(params[:id])
       #pdf = Prawn::Document.new
       #send_data pdf.render, :filename => "Horarios de aprendizes", :type => "application/pdf"
      @horario = Horario.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @horario }
      format.pdf do
        pdf = HorarioPdf.new(@horario, view_context)
        send_data pdf.render, filename:
        "Horario_#{@horario.job_horario_no}.pdf",
        type: "application/pdf"
      end
      end
  end
 
 

  def new
      @horario = Horario.new
  end

  def edit
      @horario = Horario.find(params[:id])
  end

  def create
      @horario = Horario.new(params[:horario])
      render :action => :new unless @horario.save
  end

  def update
      @horario = Horario.find(params[:id])
      render :action => :edit unless @horario.update_attributes(params[:horario])
  end

  def destroy
      @horario = Horario.find(params[:id])
      @horario.destroy
  end


  private

  def sort_column

   Horario.column_names.include?(params[:sort]) ? params[:sort] : "aula"
    
  end

  def sort_direction 

    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    
  end
  
end
