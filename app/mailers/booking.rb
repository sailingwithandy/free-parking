class Booking < ApplicationMailer

  def booking_email(customer, owner, reservation_id)
  
  end

  def test(user)
    @user = user
    mail(to: @user.email, subject: "Welcome!")
  end
end