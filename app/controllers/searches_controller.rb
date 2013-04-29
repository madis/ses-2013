class SearchesController < ApplicationController
  def regular
    @ads_entries = AdsEntry.simple_search params[:search]
  end

  def index
  end
  def show
  end
end
