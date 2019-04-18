class CoffeesController < ApplicationController
  def index
    @coffees = Coffee.all
  end

  def new
    @coffee = Coffee.new
  end

  def create
    @coffee = Coffee.new(coffee_params)

    if @coffee.save
      flash[:success] = 'Coffee successfully created'
      redirect_to coffees_path
    else
      flash[:error] = @coffee.errors.full_messages.to_sentence
      redirect_to new_coffee_path
    end
  end

  def show
    @coffee = Coffee.find(params[:id])
  end

  def destroy
    @coffee = Coffee.find(params[:id])
    @coffee.destroy
    flash[:success] = "Coffee was successfully deleted."
    redirect_to coffees_path
  end

  private

  def coffee_params
    params.require(:coffee).permit(:name, :roasters, :country, :region,
                                   :cultivation_altitude, :variety,
                                   :treatment_method, :package_quantity,
                                   :brew_method, :flavour_profile, :roast_date)
  end
end
