class ChangeDateFormatInMyTable < ActiveRecord::Migration[5.1]
  def change
    change_column :reservations, :enddate, :datetime
  end
end
