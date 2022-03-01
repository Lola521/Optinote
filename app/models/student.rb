class Student < ApplicationRecord
  has_many :observations
  belongs_to :user
  has_one_attached :photo
end
