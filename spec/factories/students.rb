# frozen_string_literal: true

FactoryBot.define do
  factory :student, class: Student do
    name { Faker::Name.name }
    roll { Faker::IDNumber.spanish_citizen_number }
    department
  end
end
