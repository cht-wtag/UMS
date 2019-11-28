# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let!(:course0) { create(:course) }

  context 'GET#index' do
    it 'returns a success response' do
      # byebug
      get :index, params: { department_id: course0.department_id }
      expect(response.status).to eq 200
    end
  end

  context 'GET#show' do
    let(:course) { create(:course) }
    it 'returns a success response' do
      get :show, params: { department_id: course.department_id, id: course.to_param }
      expect(response.status).to eq 200
    end
    it 'should return the department show template' do
      get :show, params: { department_id: course.department_id, id: course.id }
      expect(response).to render_template :show
    end
  end

  describe 'GET#new' do
    it 'assigns a new Department to @department' do
      get :new, params: { department_id: course0.department_id }
      expect(assigns(:course)).to be_a_new(Course)
    end
  end

  context 'GET #edit' do
    it 'assigns the edited requested department to the @department' do
      course = create(:course)
      get :edit, params: { department_id: course.department_id, id: course.to_param }
      expect(assigns(:course)).to eq course
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) { attributes_for(:course) }

      it 'saves the new user to the database' do
        expect do
          post :create, params: { department_id: course0.department_id, course: valid_attributes }
        end.to change(Course, :count).by(1)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        attributes_for(:course,
                       name: 'Science')
      end

      it 'locates the requested course' do
        patch :update, params: { department_id: course0.department_id, id: course0.to_param, course: valid_attributes }
        expect(assigns(:course)).to eq(course0)
      end

      it 'updates the new course in the database' do
        patch :update, params: { department_id: course0.department_id, id: course0, course: valid_attributes }
        course0.reload
        expect(course0.name).to eq('Science')
      end

      it 'redirects to the updated course#index' do
        patch :update, params: { department_id: course0.department_id, id: course0, course: valid_attributes }
        expect(response).to redirect_to department_courses_path
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the course from the database' do
      course0
      expect do
        delete :destroy, params: { department_id: course0.department_id, id: course0.to_param }
      end.to change(Course, :count).by(-1)
    end

    it 'redirects to Course#index' do
      delete :destroy, params: { department_id: course0.department_id, id: course0.to_param }
      expect(response).to redirect_to department_courses_path
    end
  end
end
