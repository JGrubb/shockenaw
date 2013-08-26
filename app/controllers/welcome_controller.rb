class WelcomeController < ApplicationController
  def index
    @shows = Show.where("date >= ?", Date.today).order("date asc")
  end
end
