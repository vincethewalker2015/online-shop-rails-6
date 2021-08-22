class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :street_address
      t.string :city
      t.string :postcode
      t.integer :user_id
      t.string :country

      t.timestamps
    end
  end
end
