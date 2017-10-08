class WelcomeController < ApplicationController
  def index

    # Cache for the next 2 hours (enough time to get the results only once in a store and not need to fetch them again)
    expires_in 2.hours, :public => true

    @item = nil
    if params[:search]
      @item = Item.search(params[:search])
    end
  end
end
