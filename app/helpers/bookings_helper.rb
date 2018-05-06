module BookingsHelper

# This helper method loops through all the bookings belonging to the sharespace that was sent through with a id param. Checks each booking's date_from and date_to, separating them into individual day dates and pushes them into an array which is then returned to the view that is calling the method.
  def calendar_date_block(object_id)
    bookings = Sharespace.find(object_id).bookings.where(paid: true).all
    block_dates = []
    bookings.each do |booking|
      (booking.date_from..booking.date_to).each do |date|
        block_dates.push(date)
      end
    end
    return block_dates
  end

end
