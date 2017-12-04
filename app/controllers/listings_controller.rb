class ListingsController < ApplicationController

  def show
    @listing = Listing.find(params[:id])
    @reservation = @listing.reservations.new
    @user = current_user
  end

  def new 
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id if current_user
    if @listing.save
      flash[:success] = "Parking spot listed!"
      redirect_to user_listing_path(id: @listing.id)
    else
      render 'new'
    end
  end

  def index 
    @listings = Listing.paginate(:page => params[:page], per_page: 12 )
    @user = current_user
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to edit_user_path(current_user.id)
  end 

  private

  def listing_params
    params.require(:listing).permit(:title, :address, :city, :price, photos:[])
  end

end



