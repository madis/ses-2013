class AdsEntriesController < ApplicationController

  def search
  end
  # GET /ads_entries
  # GET /ads_entries.json
  def index
    @ads_entries = AdsEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ads_entries }
    end
  end

  # GET /ads_entries/1
  # GET /ads_entries/1.json
  def show
    @ads_entry = AdsEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ads_entry }
    end
  end

  # GET /ads_entries/new
  # GET /ads_entries/new.json
  def new
    @ads_entry = AdsEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ads_entry }
    end
  end

  # GET /ads_entries/1/edit
  def edit
    @ads_entry = AdsEntry.find(params[:id])
  end

  # POST /ads_entries
  # POST /ads_entries.json
  def create
    @ads_entry = AdsEntry.new(params[:ads_entry])

    respond_to do |format|
      if @ads_entry.save
        format.html { redirect_to @ads_entry, notice: 'Ads entry was successfully created.' }
        format.json { render json: @ads_entry, status: :created, location: @ads_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @ads_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ads_entries/1
  # PUT /ads_entries/1.json
  def update
    @ads_entry = AdsEntry.find(params[:id])

    respond_to do |format|
      if @ads_entry.update_attributes(params[:ads_entry])
        format.html { redirect_to @ads_entry, notice: 'Ads entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ads_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ads_entries/1
  # DELETE /ads_entries/1.json
  def destroy
    @ads_entry = AdsEntry.find(params[:id])
    @ads_entry.destroy

    respond_to do |format|
      format.html { redirect_to ads_entries_url }
      format.json { head :no_content }
    end
  end
end
