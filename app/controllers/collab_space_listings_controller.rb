class CollabSpaceListingsController < ApplicationController
  before_action :set_collab_space_listing, only: [:show, :edit, :update, :destroy]

  # GET /collab_space_listings
  # GET /collab_space_listings.json
  def index

    if params[:address] != nil
      @addresses = Address.near(params[:address], 50, order: 'distance').where(addressable_type: "CollabSpaceListing")
      @current_loc = params[:address]
      @nearest_me = @addresses[0].addressable
    else
      @addresses = Address.where(addressable_type: "CollabSpaceListing")
    end
    rescue
      flash[:notice] = "Sorry couldn't find a store near you."
      redirect_to(:action => 'index')
  end

  # GET /collab_space_listings/1
  # GET /collab_space_listings/1.json
  def show
  end

  # GET /collab_space_listings/new
  def new
    @collab_space_listing = CollabSpaceListing.new
  end

  # GET /collab_space_listings/1/edit
  def edit
  end

  # POST /collab_space_listings
  # POST /collab_space_listings.json
  def create
    @collab_space_listing = CollabSpaceListing.new(collab_space_listing_params)

    respond_to do |format|
      if @collab_space_listing.save
        format.html { redirect_to edit_address_path(@collab_space_listing.address), notice: 'Collab space listing was successfully created.' }
        format.json { render :show, status: :created, location: @collab_space_listing }
      else
        format.html { render :new }
        format.json { render json: @collab_space_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collab_space_listings/1
  # PATCH/PUT /collab_space_listings/1.json
  def update
    respond_to do |format|
      if @collab_space_listing.update(collab_space_listing_params)
        format.html { redirect_to @collab_space_listing, notice: 'Collab space listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @collab_space_listing }
      else
        format.html { render :edit }
        format.json { render json: @collab_space_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collab_space_listings/1
  # DELETE /collab_space_listings/1.json
  def destroy
    @collab_space_listing.destroy
    respond_to do |format|
      format.html { redirect_to collab_space_listings_url, notice: 'Collab space listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collab_space_listing
      @collab_space_listing = CollabSpaceListing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collab_space_listing_params
      params.require(:collab_space_listing).permit(:user_id, :name, :brief_description, :description, :rules, :surrounding_area_description, :overall_rating, :cost_per_day)
    end
end
