class Order < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "150x150>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	belongs_to :user
	belongs_to :friend
	has_many :order_members ,dependent: :destroy
end
