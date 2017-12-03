class ReservationsController < ApplicationController

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.listing = @listing 
      if @reservation.save
        redirect_to edit_user_path(current_user.id)
      else
        render "/reservations/show"
      end
  end

  def destroy
  end
  
  def reservation_params
    params.require(:reservation).permit(:startdate, :enddate,)
  end

end
