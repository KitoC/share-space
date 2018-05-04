class SharespaceVenuesController < ApplicationController
  before_action :set_sharespace_venue, only: [:show, :edit, :update, :destroy]

  # GET /sharespace_venues
  # GET /sharespace_venues.json
  def index


    if params[:address] != nil
      @addresses = Address.near(params[:address], 50, order: 'distance').where(addressable_type: "SharespaceVenue")
      @current_loc = params[:address]
      @nearest_me = @addresses[0].addressable
    else
      @addresses = Address.where(addressable_type: "SharespaceVenue")
    end
    rescue
      flash[:notice] = "Sorry couldn't find a store near you."
      redirect_to(:action => 'index')
  end

  # GET /sharespace_venues/1
  # GET /sharespace_venues/1.json
  def show
  end

  # GET /sharespace_venues/new
  def new
    @sharespace_venue = SharespaceVenue.new
  end

  # GET /sharespace_venues/1/edit
  def edit
  end

  # POST /sharespace_venues
  # POST /sharespace_venues.json
  def create
    @sharespace_venue = SharespaceVenue.new(sharespace_venue_params)

    respond_to do |format|
      if @sharespace_venue.save
        format.html { redirect_to edit_address_path(@sharespace_venue.address), notice: 'Collab space listing was successfully created.' }
        format.json { render :show, status: :created, location: @sharespace_venue }
      else
        format.html { render :new }
        format.json { render json: @sharespace_venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sharespace_venues/1
  # PATCH/PUT /sharespace_venues/1.json
  def update
    respond_to do |format|
      if @sharespace_venue.update(sharespace_venue_params)
        format.html { redirect_to @sharespace_venue, notice: 'Collab space listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @sharespace_venue }
      else
        format.html { render :edit }
        format.json { render json: @sharespace_venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sharespace_venues/1
  # DELETE /sharespace_venues/1.json
  def destroy
    @sharespace_venue.destroy
    respond_to do |format|
      format.html { redirect_to sharespace_venues_url, notice: 'Collab space listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sharespace_venue
      @sharespace_venue = SharespaceVenue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sharespace_venue_params
      params.require(:sharespace_venue).permit(:user_id, :name, :brief_description, :description, :rules, :surrounding_area_description, :overall_rating, :cost_per_day)
    end
end
