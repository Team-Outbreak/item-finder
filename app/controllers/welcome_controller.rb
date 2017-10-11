require 'google/apis/customsearch_v1'

class WelcomeController < ApplicationController
  def index

    # Cache for the next 2 hours (enough time to get the results only once in a store and not need to fetch them again)
    expires_in 2.hours, :public => true

    @item = nil
    if params[:search] && params[:search].length >= 3
      @item = Item.search(params[:search])
    end
  end

  # Requires :association_name param
  def search_related_image
    # Search Google Images for the first image result related to the association
    search_client = Google::Apis::CustomsearchV1::CustomsearchService.new
    search_client.key = ENV['GOOGLE_API_KEY']
    # TODO:sb Commented out for now
    # response = search_client.list_cses(params[:association_name], {cx: ENV['GOOGLE_SEARCH_CX'], num: 1, search_type: 'image', fields: 'items'})
    # @related_image = response.items[0].link
  end
end
