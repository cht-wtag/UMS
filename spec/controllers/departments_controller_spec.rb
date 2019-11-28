# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DepartmentsController, type: :controller do
  let(:department0) { create(:department) }

  context 'GET#index' do
    it 'returns a success response' do
      get :index
      expect(response.status).to eq 200
    end
  end

  context 'GET#show' do
    let(:department) { create(:department) }
    it 'returns a success response' do
      get :show, params: { id: department.to_param }
      expect(response.status).to eq 200
    end
    it 'should return the department show template' do
      get :show, params: { id: department.id }
      expect(response).to render_template :show
    end
  end

  describe 'GET#new' do
    it 'assigns a new Department to @department' do
      get :new
      expect(assigns(:department)).to be_a_new(Department)
    end
  end

  context 'GET #edit' do
    it 'assigns the edited requested department to the @department' do
      department = create(:department)
      get :edit, params: { id: department.to_param }
      expect(assigns(:department)).to eq department
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) { attributes_for(:department) }
      it 'saves the new user in the database' do
        expect do
          post :create, params: { department: valid_attributes }
        end.to change(Department, :count).by(1)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        attributes_for(:department,
                       name: 'Science')
      end

      it 'locates the requested department' do
        patch :update, params: { id: department0, department: valid_attributes }
        expect(assigns(:department)).to eq(department0)
      end

      it 'updates the new department in the database' do
        patch :update, params: { id: department0, department: valid_attributes }
        department0.reload
        expect(department0.name).to eq('Science')
      end

      it 'redirects to the updated department#index' do
        patch :update, params: { id: department0, department: valid_attributes }
        expect(response).to redirect_to departments_path
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the department from the database' do
      department0
      expect do
        delete :destroy, params: { id: department0.to_param }
      end.to change(Department, :count).by(-1)
    end

    it 'redirects to Department#index' do
      delete :destroy, params: { id: department0.to_param }
      expect(response).to redirect_to departments_path
    end
  end
end
