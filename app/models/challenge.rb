class Challenge < ApplicationRecord

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  has_attached_file :cover_pic, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :cover_pic, content_type: /\Aimage\/.*\z/


  INPUT_TYPE = %w(picture text both auto)
  belongs_to :city
  has_many :team_challenges
  has_many :teams, through: :team_challenges
  # has_many :answers
  has_one :answer
  validates :input_type, presence: true, inclusion: { in: INPUT_TYPE }
  validates :title, presence: true
  validates :description, presence: true
  validates :score, presence: true
  validates :cost, presence: true





  def answer_text?
    input_type == 'text'
  end

  def answer_picture?
    input_type == 'picture'
  end

  def answer_both?
    input_type == 'both'
  end

  def answer_auto?
    input_type == 'auto'
  end

end
