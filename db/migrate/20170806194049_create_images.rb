class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :title
      t.string :url
      t.string :description
      t.float :longitude
      t.float :latitude
      t.string :address
      t.integer :user_id

      t.timestamps
    end
  end
end
