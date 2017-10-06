class WelcomeController < ApplicationController
  def index
    @item = nil
    if params[:search]
      @item = Item.search(params[:search])
    end
  end
end
