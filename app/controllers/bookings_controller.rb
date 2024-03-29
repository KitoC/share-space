class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]


  # GET /bookings
  # GET /bookings.json
  def index
    authorization("admin")
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    authorization("owner", @booking.user)
  end

  def reserved
    @booking = current_user.bookings.last
  end

  # GET /bookings/new
  def new
    authorization("create")
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
    authorization("update", @booking)
  end

  # POST /bookings
  # POST /bookings.json
  def create
    authorization("create")

    @booking = Booking.new(booking_params)
    incorrect_dates and return unless correct_dates?(@booking)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to current_user.bookings.last, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    authorization("update", @booking)

    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    authorization("destroy", @booking)

    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:date_from, :date_to, :total_days, :user_id, :sharespace_id)
    end

end
