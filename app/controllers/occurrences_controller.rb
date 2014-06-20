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
      #redirect_to root_path, notice: 'Success'
      render :index, notice: 'Success'
    else
      render :new
    end
  end

  def strong_params
    params.require(:occurrence).permit!
  end
end
