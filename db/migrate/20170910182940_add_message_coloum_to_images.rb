class AddMessageColoumToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :message, :string
  end
end
