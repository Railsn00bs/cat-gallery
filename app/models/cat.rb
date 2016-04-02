class Cat < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, styles: { small: "100x100>", medium: "300x300>", large: "500x500>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
