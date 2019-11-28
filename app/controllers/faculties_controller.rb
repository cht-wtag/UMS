# frozen_string_literal: true

class FacultiesController < ApplicationController
  def index
    @dept = params[:department_id]
    @department = Department.find_by(id: params[:department_id])
    @faculties = Faculty.all.where(department_id: @dept)
  end

  def show; end

  def new
    @faculty = Faculty.new
  end

  def edit
    @faculty = Faculty.find(params[:id])
  end

  def create
    @faculty = Faculty.new(faculty_params.merge(department_id: params[:department_id]))
    if @faculty.save
      redirect_to department_faculties_path(@faculty.department_id)
    else
      render 'new'
    end
  end

  def update
    @faculty = Faculty.find(params[:id])

    if @faculty.update(faculty_params.merge(department_id: params[:department_id]))
      redirect_to department_faculties_path(@faculty.department_id)
    else
      render 'edit'
    end
  end

  def destroy
    @faculty = Faculty.find(params[:id])
    @temp = @faculty
    @faculty.destroy
    redirect_to department_faculties_path
  end

  private

  def faculty_params
    params.require(:faculty).permit(:name, :department_id, :position)
  end
end
