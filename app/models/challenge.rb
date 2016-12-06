class Challenge < ApplicationRecord

  INPUT_TYPE = %w(picture text both)
  belongs_to :city
  has_many :teams, through: :team_challenges
  # has_many :answers
  has_one :answer
  validates :input_type, presence: true, inclusion: { in: INPUT_TYPE }

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
    true
  end

end
