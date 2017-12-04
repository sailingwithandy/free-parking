class ReservationsController < ApplicationController

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.listing = @listing
    @user = current_user 
      if @reservation.save
        redirect_to edit_user_path(current_user.id)
      else
        @errors = @reservation.errors.full_messages
        render "/listings/show"
      end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to edit_user_path(current_user.id)
  end
  
  def reservation_params
    params.require(:reservation).permit(:startdate, :enddate, )
  end

end
