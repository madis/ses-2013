class SearchesController < ApplicationController
  def regular
    @ads_entries = AdsEntry.simple_search params[:search]
  end

  def sphinx
    @ads_entries = AdsEntry.search params[:search] if params[:search].present?
  end

  def elastic
    @ads_entries = AdsEntry.tire_search params[:search] if params[:search].present?
  end

  def index
  end

  def show
    render :index
  end

end
