class OccurrencesController < ApplicationController

  before_filter :check_coordinates, :only => :new

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
      redirect_to root_path
    else
      render :new
    end

  end

  def check_coordinates
    redirect_to root_path unless params[:lng].present? and params[:lat].present?
  end

  def strong_params
    params.require(:occurrence).permit(:occurrence_type_id, :description, :coordinate)
  end
end
