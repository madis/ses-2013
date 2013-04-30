class SearchesController < ApplicationController
  def regular
    @ads_entries = AdsEntry.simple_search params[:search]
  end

  def sphinx
    @ads_entries = AdsEntry.search params[:search] if params[:search].present?
  end

  def elastic
  end

  def index
  end

  def show
    render :index
  end

  def active?(name)
    'active' if params[:action] == name
  end

  helper_method :active?
end
