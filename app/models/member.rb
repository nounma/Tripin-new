class Member < ApplicationRecord
  belongs_to :user
  belongs_to :team
  attr_accessor :email
end
