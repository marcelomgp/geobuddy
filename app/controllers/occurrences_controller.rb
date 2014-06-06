class OccurrencesController < ApplicationController

  def new
    @occurence = Occurrence.new
  end

  def index
    @occurrences = Occurrence.all#find(params[:id])
    render json: @occurrences
  end

  def create
    @occurrence = Occurrence.new(strong_params)

    @occurrence.save
    redirect_to root_path
  end

  def strong_params
    params.require(:occurrence).permit(:description, :coordinate)
  end

end
