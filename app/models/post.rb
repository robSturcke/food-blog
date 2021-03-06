class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true

  has_attached_file :picture, styles: { medium: "500x500", thumb: "100x100", large: "900x900 " }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
