class ShowsController < ApplicationController

  def show

  end
  
  def new
    @show = Show.new
    render layout: false
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
  end

  def update
    @show = Show.find params[:id]
    if @show.update_attributes show_params
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
