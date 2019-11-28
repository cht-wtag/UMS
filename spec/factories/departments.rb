# frozen_string_literal: true

FactoryBot.define do
  factory :department, class: Department do
    name { Faker::Name.name }
  end
end
