# frozen_string_literal: true

class Registration < ApplicationRecord
  belongs_to :course
  belongs_to :student
end
