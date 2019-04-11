class CoffeeController < ApplicationController
  def index
    @coffee = Coffee.all
  end
end
