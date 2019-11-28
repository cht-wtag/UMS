# frozen_string_literal: true

class RemoveFacultyIdFromCourses < ActiveRecord::Migration[6.0]
  def change
    remove_column :courses, :faculty_id, :bigint
  end
end
