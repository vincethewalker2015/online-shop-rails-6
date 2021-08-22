class CreateUserProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_profiles do |t|
      t.references :user, foreign_key: true
      t.references :profile, foreign_key: true
      
      t.timestamps
    end
  end
end
