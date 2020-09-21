class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [ :show ]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @cocktail.save! && @dose.save!
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def dose_params
    params.require(:cocktail).permit(dose_attributes: [:description, :ingredient])
  end
end
