class SpicesController < ApplicationController


  def index
    spices = Spice.all()
    render json: spices, status: :ok
  end 

  def show
    spice = spice_item
    if spice
        render json: spice, status: :ok
    else
        spice_error
    end
  end

  def destroy
    spice = spice_item
    if spice
        spice.destroy
        head :no_content
    else
        spice_error
    end

  end

  def update
    spice = spice_item
    if spice
        spice.update(spice_params)
        render json: spice, status: :ok
    else
        spice_error
    end

  end

  private

  def spice_error
    render json: {error: "Spice not found"}
  end

  def spice_params
    params.permit(:title, :image, :description, :notes, :ratings)
  end

  def spice_item
    Spice.find_by(id: params[:id])
  end
end
