# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FacultiesController, type: :controller do
  let!(:faculty0) { create(:faculty) }

  context 'GET#index' do
    it 'returns a success response' do
      # byebug
      get :index, params: { department_id: faculty0.department_id }
      expect(response.status).to eq 200
    end
  end

  context 'GET#show' do
    let(:faculty) { create(:faculty) }
    it 'returns a success response' do
      get :show, params: { department_id: faculty.department_id, id: faculty.to_param }
      expect(response.status).to eq 200
    end
    it 'should return the department show template' do
      get :show, params: { department_id: faculty.department_id, id: faculty.id }
      expect(response).to render_template :show
    end
  end

  describe 'GET#new' do
    it 'assigns a new Department to @department' do
      get :new, params: { department_id: faculty0.department_id }
      expect(assigns(:faculty)).to be_a_new(Faculty)
    end
  end

  context 'GET #edit' do
    it 'assigns the edited requested department to the @department' do
      faculty = create(:faculty)
      get :edit, params: { department_id: faculty.department_id, id: faculty.to_param }
      expect(assigns(:faculty)).to eq faculty
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) { attributes_for(:faculty) }
      it 'saves the new user in the database' do
        expect do
          post :create, params: { department_id: faculty0.department_id, faculty: valid_attributes }
        end.to change(Faculty, :count).by(1)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        attributes_for(:faculty,
                       name: 'Science',
                       position: 'Major')
      end

      it 'locates the requested faculty' do
        patch :update, params: { department_id: faculty0.department_id, id: faculty0.to_param, faculty: valid_attributes }
        expect(assigns(:faculty)).to eq(faculty0)
      end

      it 'updates the new faculty in the database' do
        patch :update, params: { department_id: faculty0.department_id, id: faculty0, faculty: valid_attributes }
        faculty0.reload
        expect(faculty0.name).to eq('Science')
        expect(faculty0.position).to eq('Major')
      end

      it 'redirects to the updated faculty#index' do
        patch :update, params: { department_id: faculty0.department_id, id: faculty0, faculty: valid_attributes }
        expect(response).to redirect_to department_faculties_path
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the faculty from the database' do
      faculty0
      expect do
        delete :destroy, params: { department_id: faculty0.department_id, id: faculty0.to_param }
      end.to change(Faculty, :count).by(-1)
    end

    it 'redirects to Faculties#index' do
      delete :destroy, params: { department_id: faculty0.department_id, id: faculty0.to_param }
      expect(response).to redirect_to department_faculties_path
    end
  end
end
