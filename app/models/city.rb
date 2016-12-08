class City < ApplicationRecord

  CITIES = %w(Brussels Paris Amsterdam London)

  has_many :challenges
  validates :name, presence: true, inclusion: { in: CITIES }

  has_attached_file :cover_pic, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :cover_pic, content_type: /\Aimage\/.*\z/

end
