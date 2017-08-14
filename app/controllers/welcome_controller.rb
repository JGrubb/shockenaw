class WelcomeController < ApplicationController
  def index
    @shows = Show.where("date >= ?", Date.today).order("date asc")
    @products = Product.all
  end
end
