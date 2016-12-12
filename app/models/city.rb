class City < ApplicationRecord


  has_many :challenges
  has_many :teams
  validates :name, presence: true

  has_attached_file :cover_pic, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :cover_pic, content_type: /\Aimage\/.*\z/

end
