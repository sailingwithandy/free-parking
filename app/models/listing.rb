class Listing < ActiveRecord::Base
  belongs_to :user
  mount_uploaders :photos, PhotoUploader
  has_many :reservations, dependent: :destroy #destroys reservations + listing

  def self.search(search)
    if search 
      where(["city LIKE ?", "%#{search}%"])
    else
      all
    end
  end

end
