class AddAttachmentUrlToImages < ActiveRecord::Migration[5.1]
  def self.up
    change_table :images do |t|
      t.attachment :url
    end
  end

  def self.down
    remove_attachment :images, :url
  end
end
