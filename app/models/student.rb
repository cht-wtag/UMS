# frozen_string_literal: true

class Student < ApplicationRecord
  validates :name, presence: true
  validates :roll, presence: true, length: { maximum: 50 }, uniqueness: true
  has_many :registrations
  has_many :courses, through: :registrations, dependent: :destroy
  belongs_to :department
end
