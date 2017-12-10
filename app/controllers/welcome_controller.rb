class WelcomeController < ApplicationController
  def index
    @user = current_user
    @titles = Listing.distinct.pluck(:title)
  end
end