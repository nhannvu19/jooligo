class CreateGuides < ActiveRecord::Migration[5.1]
  def change
    create_table :guides do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :phone
      t.integer :price
      t.string :tourplan
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
