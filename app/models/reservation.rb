class Reservation < ActiveRecord::Base
belongs_to :user
belongs_to :listing
validate :overlapping_time

def overlapping_time
  listing.reservations.each do |old_reservation|
    if overlap?(self, old_reservation)
      return errors.add(:overlapping_time, "Someone has already reserved this space for this time.")
      flash[:overlapping_time] = "Someone has already reserved this space for this time."
    end
  end
end

def overlap?(x,y)
  (x.startdate - x.enddate) * (y.startdate - y.enddate) > 0
end

def total_price
  starttime = startdate
  endtime = enddate
  price = listing.price.to_i
  hours = ((endtime - starttime) / 3600).to_i
  return hours * price 
end


end
