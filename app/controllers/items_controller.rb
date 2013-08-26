class ItemsController < ApplicationController
  def new
    @item = Item.new
    render layout: false
  end
  
  def create
    @item = Item.new params[:item]
  end

end
