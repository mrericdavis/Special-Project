class Image < ApplicationRecord
  has_attached_file :url, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :url, content_type: /\Aimage\/.*\z/
  
  belongs_to :user
  has_many :comments
end
