# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :find_department
  def index
    @dept = params[:department_id]
    @department = Department.find_by(id: params[:department_id])
    @courses = Course.all.where(department_id: @dept)
  end

  def show
    @course = Course.find_by(id: params[:id])
    @students = @course.students
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(course_params.merge(department_id: params[:department_id]))
    if @course.save
      redirect_to department_courses_path(@course.department_id)
    else

      render 'new'
    end
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to department_courses_path(@course.department_id)
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @temp = @course
    @course.destroy
    redirect_to department_courses_path(@temp.department_id)
  end

  private

  def course_params
    params.require(:course).permit(:name, :department_id)
  end

  def find_department; end
end
