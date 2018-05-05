module BookingsHelper

  def calendar_date_block(ss_id)
    bookings = Sharespace.find(ss_id).bookings.all
    block_dates = []
    bookings.each do |booking|
      (booking.date_from..booking.date_to).each do |date|
       block_dates.push(date)
      end
    end
    return block_dates
  end
end
