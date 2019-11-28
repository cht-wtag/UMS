# frozen_string_literal: true

class CreateRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.belongs_to :department
      t.belongs_to :faculty
      t.timestamps
    end

    create_table :students do |t|
      t.string :name
      t.string :roll
      t.belongs_to :department
      t.timestamps
    end

    create_table :registrations do |t|
      t.belongs_to :course
      t.belongs_to :student
      t.datetime :registration_date
      t.timestamps
    end
  end
end
