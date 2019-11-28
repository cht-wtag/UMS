# frozen_string_literal: true

FactoryBot.define do
  factory :faculty, class: Faculty do
    name { Faker::Name.name }
    position { Faker::Military.army_rank }
    department
  end
end
