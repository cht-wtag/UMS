# frozen_string_literal: true

class StudentsController < ApplicationController
  def index
    @dept = params[:department_id]
    @department = Department.find_by(id: params[:department_id])
    @students = Student.all.where(department_id: @dept)
  end

  def show
    @dept = params[:department_id]
    if @dept.nil?
      @student = Student.find_by(id: params[:id])
      @course = Course.find_by(id: params[:course_id])
      @student.courses << @course
      render 'students/ad'
    else
      @department = Department.find_by(id: params[:department_id])
      @courses = Course.all.where(department_id: params[:department_id])
      @student = Student.find_by(id: params[:id])
    end
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params.merge(department_id: params[:department_id]))
    if @student.save
      redirect_to department_students_path(@student.department_id)
    else
      render 'new'
    end
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to department_students_path(@student.department_id)
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @temp = @student
    @student.destroy
    redirect_to department_students_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :roll, :department_id)
  end
end
