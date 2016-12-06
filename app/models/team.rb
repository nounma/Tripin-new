class Team < ApplicationRecord
  
  mount_uploader :team_picture, PhotoUploader
  
  has_many :users, through: :members
  has_many :answers
  has_many :challenges, through: :team_challenges
    after_create :assign_challenges

  def assign_challenges
    trip_length = end_date - start_date #transform string en date
    if trip_length > 3
      num_challenge = 20
    else trip_length < 3
      num_challenge = 50
    end

    city_select = City.find_by_name(city)
    self << Challenge.where(city_id: city_select.id).take(num_challenge)
  end

end
