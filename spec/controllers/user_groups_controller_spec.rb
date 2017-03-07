require 'rails_helper'

describe UserGroupsController do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:org) { create(:user_group) }

  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe '#new' do
    it 'requires user to be an admin' do
      get :new
      expect(response.status).to eq(401)
    end
  end

  describe '#index' do
    it 'requires user to be an admin' do
      get :index
      expect(response.status).to eq(401)
    end

    it 'requires user to be signed in' do
      allow(controller).to receive(:current_user).and_return(nil)
      get :index
      expect(response.status).to eq(401)
    end
  end

  describe '#create' do
    it 'requires user to be an admin' do
      post :create
      expect(response.status).to eq(401)
    end

    it 'renders #new if it fails to create' do
      user.admin = true
      post :create, user_group: { name: '' }
      expect(response).to render_template(:new)
    end
  end

  describe '#destroy' do
    it 'requires user to be an admin' do
      delete :destroy, id: org.id
      expect(response.status).to eq(401)
    end
  end

  describe '#edit' do
    it 'requires user to be an admin' do
      get :edit, id: org.id
      expect(response.status).to eq(401)
    end
  end

  describe '#update' do
    it 'requires user to be an admin' do
      patch :update, id: org.id
      expect(response.status).to eq(401)
    end

    it 'renders #edit if it fails to create' do
      user.admin = true
      patch :update, id: org.id, user_group: { name: '' }
      expect(response).to render_template(:edit)
    end
  end
end
