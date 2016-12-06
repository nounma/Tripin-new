class City < ApplicationRecord

  CITIES = %w(Brussels Paris Amsterdam London)

  has_many :challenges
<<<<<<< HEAD

=======
>>>>>>> master
  validates :name, presence: true, inclusion: { in: CITIES }

end
