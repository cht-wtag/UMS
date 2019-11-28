# frozen_string_literal: true

class AddPositionToFaculties < ActiveRecord::Migration[6.0]
  def change
    add_column :faculties, :position, :string
  end
end
