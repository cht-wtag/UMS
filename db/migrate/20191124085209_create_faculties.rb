# frozen_string_literal: true

class CreateFaculties < ActiveRecord::Migration[6.0]
  def change
    create_table :faculties do |t|
      t.string :name
      t.belongs_to :department
      t.timestamps
    end
  end
end
