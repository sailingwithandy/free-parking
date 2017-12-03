class Listing < ActiveRecord::Base
belongs_to :user
mount_uploaders :photos, PhotoUploader
has_many :reservations
end
