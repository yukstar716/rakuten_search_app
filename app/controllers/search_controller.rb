class SearchController < ApplicationController
  
  def search
    if params[:keyword].present?

      # RakutenWebService::Ichiba.debug = true
      
    item = RakutenWebService::Ichiba::Item.search(
      params[:keyword],
      # dataType: 'script',
      # response_group: 'ItemAttributes, Images',
      # country: 'jp'
      )

      @search = []
      search.items.each do |item|
        search = Search.new(
          item.get('itemName'),
          item.get('mediumImageUrls'),
          item.get('itemCaption'),
        )
        @search << search
        end
      end
    end
  end
