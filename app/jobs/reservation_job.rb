class ReservationJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    
    Booking.test(user).deliver_now
  
  end
end

