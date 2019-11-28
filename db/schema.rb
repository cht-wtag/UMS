# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_191_126_074_727) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'courses', force: :cascade do |t|
    t.string 'name'
    t.bigint 'department_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['department_id'], name: 'index_courses_on_department_id'
  end

  create_table 'departments', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'faculties', force: :cascade do |t|
    t.string 'name'
    t.bigint 'department_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'position'
    t.index ['department_id'], name: 'index_faculties_on_department_id'
  end

  create_table 'registrations', force: :cascade do |t|
    t.bigint 'course_id'
    t.bigint 'student_id'
    t.datetime 'registration_date'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['course_id'], name: 'index_registrations_on_course_id'
    t.index ['student_id'], name: 'index_registrations_on_student_id'
  end

  create_table 'students', force: :cascade do |t|
    t.string 'name'
    t.string 'roll'
    t.bigint 'department_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['department_id'], name: 'index_students_on_department_id'
  end
end
