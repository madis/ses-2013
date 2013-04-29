class SearchesController < ApplicationController
  def regular
    @ads_entries = AdsEntry.search(params[:search])
  end

  def index
  end
  def show
  end
end
