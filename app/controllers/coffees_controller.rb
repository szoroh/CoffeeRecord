# frozen_string_literal: true

class CoffeesController < ApplicationController
  before_action :set_coffee, only: %i[show edit destroy update]

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

  def show; end

  def destroy
    @coffee.destroy
    flash[:success] = 'Coffee was successfully deleted.'
    redirect_to coffees_path
  end

  def edit; end

  def update
    if @coffee.update(coffee_params)
      flash[:success] = 'Coffee has been successfully updated.'
      redirect_to coffees_path
    else
      flash[:error] = @coffee.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def coffee_params
    params.require(:coffee).permit(:name, :roasters, :country, :region,
                                   :cultivation_altitude, :variety,
                                   :treatment_method, :package_quantity,
                                   :brew_method, :flavour_profile, :roast_date,
                                   :user_id)
  end

  def set_coffee
    @coffee = Coffee.find(params[:id])
  end
end
