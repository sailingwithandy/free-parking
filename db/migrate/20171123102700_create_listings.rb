class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :address
      t.string :city
      t.string :price
      t.references :user, foreign_key: true 
      t.timestamps
    end
  end
end