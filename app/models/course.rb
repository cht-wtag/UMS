# frozen_string_literal: true

class Course < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :registrations
  has_many :students, through: :registrations, dependent: :destroy
  belongs_to :department
end
