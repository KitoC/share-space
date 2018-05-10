class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /addresses
  # GET /addresses.json
  def index
    authorization("admin")
    @addresses = Address.all
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
    authorization("admin")
  end

  # GET /addresses/new
  def new
    # Note - users and venues are all created a default address when they sign up. So considering users and venues only have_one :address, neither class needs to create a new address for any reason.
    authorization("admin")
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
    authorization("update", @address.addressable)
  end

  # POST /addresses
  # POST /addresses.json
  def create
    authorization("admin")

    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    authorization("update", @address.addressable)

    respond_to do |format|
      if @address.update(address_params)
        if @address.addressable_type == "SharespaceVenue"
          format.html {redirect_to @address.addressable, notice: 'Address was successfully updated.' }
          format.json { render :show, status: :ok, location: @address }
        else
          format.html { redirect_to user_path, notice: 'Address was successfully updated.' }
          format.json { render :show, status: :ok, location: @address }
        end
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    authorization("destroy", @address)

    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:address_line_one, :address_line_two, :city_suburb, :state, :postcode, :country)
    end


end
