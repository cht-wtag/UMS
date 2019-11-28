# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let!(:student0) { create(:student) }

  context 'GET#index' do
    it 'returns a success response' do
      # byebug
      get :index, params: { department_id: student0.department_id }
      expect(response.status).to eq 200
    end
  end

  context 'GET#show' do
    let(:student) { create(:student) }
    it 'returns a success response' do
      get :show, params: { department_id: student.department_id, id: student.to_param }
      expect(response.status).to eq 200
    end
    it 'should return the department show template' do
      get :show, params: { department_id: student.department_id, id: student.id }
      expect(response).to render_template :show
    end
  end

  describe 'GET#new' do
    it 'assigns a new Department to @department' do
      get :new, params: { department_id: student0.department_id }
      expect(assigns(:student)).to be_a_new(Student)
    end
  end

  context 'GET #edit' do
    it 'assigns the edited requested department to the @department' do
      student = create(:student)
      get :edit, params: { department_id: student.department_id, id: student.to_param }
      expect(assigns(:student)).to eq student
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) { attributes_for(:student) }
      it 'saves the new user in the database' do
        expect do
          post :create, params: { department_id: student0.department_id, student: valid_attributes }
        end.to change(Student, :count).by(1)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        attributes_for(:student,
                       name: 'Science',
                       roll: '143011')
      end

      it 'locates the requested student' do
        patch :update, params: { department_id: student0.department_id, id: student0.to_param, student: valid_attributes }
        expect(assigns(:student)).to eq(student0)
      end

      it 'updates the new student in the database' do
        patch :update, params: { department_id: student0.department_id, id: student0, student: valid_attributes }
        student0.reload
        expect(student0.name).to eq('Science')
        expect(student0.roll).to eq('143011')
      end

      it 'redirects to the updated student#index' do
        patch :update, params: { department_id: student0.department_id, id: student0, student: valid_attributes }
        expect(response).to redirect_to department_students_path
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the student from the database' do
      student0
      expect do
        delete :destroy, params: { department_id: student0.department_id, id: student0.to_param }
      end.to change(Student, :count).by(-1)
    end

    it 'redirects to Student#index' do
      delete :destroy, params: { department_id: student0.department_id, id: student0.to_param }
      expect(response).to redirect_to department_students_path
    end
  end
end
