class Student < ApplicationRecord
  has_many :observations
  belongs_to :classroom
  belongs_to :user
  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :classroom, presence: true
end
