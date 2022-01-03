class AddUniquenessToProfileAndCategories < ActiveRecord::Migration[6.1]
  def change
    add_index :categories, :name, unique: true
    add_index :profiles, :email, unique: true
    add_index :profiles, :phone, unique: true
  end
end
