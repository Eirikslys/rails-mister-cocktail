class DosesController < ApplicationController

  def new
    find_cocktail
    # @cocktail.doses = Dose.new
    @dose = Dose.new
    @dose.cocktail = @cocktail
  end

  def create
    find_cocktail
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
  end

  private
  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
