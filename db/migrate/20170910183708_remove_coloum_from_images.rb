class RemoveColoumFromImages < ActiveRecord::Migration[5.1]
  def change
    remove_column :images, :longitude, :float
    remove_column :images, :latitude, :float
    remove_column :images, :address, :string
    remove_column :images, :url, :string
  end
end
