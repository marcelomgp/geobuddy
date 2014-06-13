class OccurrencesController < ApplicationController

  def new
    @occurence = Occurrence.new
  end

  def index
    @occurrences = Occurrence.all
  end

  def create
    @occurrence = Occurrence.new(strong_params)

    if @occurrence.save
      flash[:alert] = "Occurrence created with success!"
      redirect_to root_path
    else
      flash[:alert] = "Error! Verify form fields."
      render 'new'
    end

  end

  def strong_params
    params.require(:occurrence).permit(:occurrence_type_id, :description, :coordinate)
  end
end
