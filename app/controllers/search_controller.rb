class SearchController < ApplicationController
  before_action :doorkeeper_authorize! # Require access token for all actions

  def get_book_info
    result = Searcher.new(params[:q]).get_search_data

    render json: {
      err: nil,
      params: params,
      total_result: result.entries.count,
      result: result.entries
    }
  end
end
