# frozen_string_literal: true

class Faculty < ApplicationRecord
  validates :name, presence: true
  validates :position, presence: true, length: { maximum: 100 }
  belongs_to :department
end
