class OccurrencesController < ApplicationController

  def new
    @occurence = Occurrence.new
  end

  def index
    @occurrences = Occurrence.all
    render json: @occurrences
  end

  def create
    @occurrence = Occurrence.new(strong_params)

    if @occurrence.save
      flash[:notice] = "Occurrence created with success!"
      redirect_to root_path
    else
      flash[:notice] = "Error! Verify form fields."
      render 'new'
    end

  end

  def strong_params
    params.require(:occurrence).permit(:occurrence_type_id, :description, :coordinate)
  end

end
