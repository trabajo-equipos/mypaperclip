class InstructoresController < ApplicationController
   helper_method :sort_column, :sort_direction
 
  def index
   
    @instructores = Instructor.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(2)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @instructores }
    end
  end
  def show
      @instructor = Instructor.find(params[:id])
      #@instructores = Instructor.find(params[:instructor])
  end

  def new
      @instructor = Instructor.new
      
  end

  def edit
      @instructor = Instructor.find(params[:id])
  end

  def create
      #@instructor = Instructor.new(params[:instructor])
      #render :action => :new unless @instructor.save
      #@instructores = Instructor.all
       @instructor = Instructor.new(params[:instructor])
      respond_to do |format|
      if @instructor.save
        format.html { redirect_to instructores_path, notice: 'Post was successfully created.' }
        format.json { render json: @instructor, status: :created, location: @instructor }
      else
        format.html { render action: "new" }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
      @instructor = Instructor.find(params[:id])
      render :action => :edit unless @instructor.update_attributes(params[:instructor])
  end

  def destroy
      @instructor = Instructor.find(params[:id])
      @instructor.destroy
      @instructores = Instructor.all

  end

   private

  def sort_column

   Instructor.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
    
  end

  def sort_direction 

    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    
  end
  
end
