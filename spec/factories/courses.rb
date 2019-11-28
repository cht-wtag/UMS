# frozen_string_literal: true

FactoryBot.define do
  factory :course, class: Course do
    name { Faker::Name.name }
    department
  end
end
