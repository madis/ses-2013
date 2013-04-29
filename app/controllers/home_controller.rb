class HomeController < ApplicationController
  def index
    @ads_entries = AdsEntry.search(params[:search])
  end
end
