class Listing < ActiveRecord::Base
  belongs_to :user
  mount_uploaders :photos, PhotoUploader
  has_many :reservations

  def self.search(search)
    if search 
      where(["city LIKE ?", "%#{search}%"])
    else
      all
    end
  end

end
