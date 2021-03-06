class ShowsController < ApplicationController

  before_action :authenticate_user!

  def show

  end
  
  def new
    @show = Show.new
  end

  def create
    @show = Show.new show_params
    if @show.save
      flash[:notice] = "#{@show.date} was successfully created."
      redirect_to root_path
    else
      flash[:error] = @show.errors
      redirect_to root_path
    end
  end

  def edit
    @show = Show.find params[:id]
    render layout: false
  end

  def update
    @show = Show.find params[:id]
    if @show.update show_params
      redirect_to root_path
    end
  end

  def delete

  end

  private

  def show_params
    params.require(:show).permit(:date, :venue, :location, :info, :link)
  end
end
