class LocationAddressesController < ApplicationController
  before_action :set_location_address, only: [:show, :edit, :update, :destroy]

  # GET /location_addresses
  # GET /location_addresses.json
  def index
    @location_addresses = LocationAddress.all
  end

  # GET /location_addresses/1
  # GET /location_addresses/1.json
  def show
  end

  # GET /location_addresses/new
  def new
    @location_address = LocationAddress.new
  end

  # GET /location_addresses/1/edit
  def edit
  end

  # POST /location_addresses
  # POST /location_addresses.json
  def create
    @location_address = LocationAddress.new(location_address_params)

    respond_to do |format|
      if @location_address.save
        format.html { redirect_to @location_address, notice: 'Location address was successfully created.' }
        format.json { render :show, status: :created, location: @location_address }
      else
        format.html { render :new }
        format.json { render json: @location_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_addresses/1
  # PATCH/PUT /location_addresses/1.json
  def update
    respond_to do |format|
      if @location_address.update(location_address_params)
        format.html { redirect_to @location_address, notice: 'Location address was successfully updated.' }
        format.json { render :show, status: :ok, location: @location_address }
      else
        format.html { render :edit }
        format.json { render json: @location_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_addresses/1
  # DELETE /location_addresses/1.json
  def destroy
    @location_address.destroy
    respond_to do |format|
      format.html { redirect_to location_addresses_url, notice: 'Location address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_address
      @location_address = LocationAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_address_params
      params.require(:location_address).permit(:city_suburb, :state, :country, :postcode)
    end
end
