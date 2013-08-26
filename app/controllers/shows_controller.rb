class ShowsController < ApplicationController

  def show

  end
  
  def new
    @show = Show.new
    render layout: false
  end

  def create
    @show = Show.new params[:show]
    if @show.save
      flash[:notice] = "#{@show.date} was successfully created."
      redirect_to root_path
    else
      flash[:error] = @show.errors
      redirect_to root_path
    end
  end

  def edit

  end

  def update

  end

  def delete

  end
end
