class City < ApplicationRecord

  CITIES = %w(Brussels Paris Amsterdam London)

  has_many :challenges
  validates :name, presence: true, inclusion: { in: CITIES }

end
