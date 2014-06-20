class OccurrencesController < ApplicationController

  def new
    @occurrence = Occurrence.new
    @occurrence.coordinate = Occurrence.location_point(params[:lat], params[:lng]) 
  end

  def index
    @occurrences = Occurrence.all
  end

  def create
    @occurrence = Occurrence.new(strong_params)

    if @occurrence.save
      redirect_to root_path, notice: 'Occurrence created!'
    else  
      render :new
    end
  end

  def bbox
    #binding.pry
    @occurrences = Occurrence.within_box(params[:w], params[:n], params[:e], params[:s])
  end

  def strong_params
    params.require(:occurrence).permit!
  end
end
