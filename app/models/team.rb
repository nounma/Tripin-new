class Team < ApplicationRecord


  mount_uploader :team_picture, PhotoUploader


  belongs_to :user
  has_many :answers
  has_many :team_challenges
  has_many :challenges, through: :team_challenges

  after_create :assign_challenges

  def assign_challenges

   #  trip_length = self.end_date - self.start_date #transform string en date

   # trip_lenght = DateTime.strptime(@end_date, '%m/%d/%Y') - DateTime.strptime(@start_date, '%m/%d/%Y')


   #  if trip_length.to_i > 3
   #    num_challenge = 20
   #  else trip_length.to_i < 3
   #    num_challenge = 50
   #  end

   #  city_select = City.find_by_name(city)
   #  self << Challenge.where(city_id: city_select.id).take(20)
    # team.challenges = tous les challenges !

  end

end
