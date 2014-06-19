class OccurrencesController < ApplicationController

  def new
    @occurrence = Occurrence.new
    @occurrence.coordinate = Occurrence.location_point(params[:lat], params[:lng]) 
    @occurrence.occurrence_type = OccurrenceType.all.sample
  end

  def index
    @occurrences = Occurrence.all
  end

  def create
    @occurrence = Occurrence.new(strong_params)

    if @occurrence.save
      redirect_to root_path, notice: 'Success'
    else
      render :new
    end
  end

  def strong_params
    params.require(:occurrence).permit!
  end
end
