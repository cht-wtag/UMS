# frozen_string_literal: true

class Department < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :faculties, dependent: :destroy
  has_many :students, dependent: :destroy
  has_many :courses, dependent: :destroy
end
