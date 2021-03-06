class Restaurant < ApplicationRecord
	has_attached_file :menu_photo, styles: { medium: "600x600>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :menu_photo, content_type: /\Aimage\/.*\z/

  has_many :orders

end
