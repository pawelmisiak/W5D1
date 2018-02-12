require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe 'GET #new' do
    it 'should render new user template' do
      get :new
      expect(response).to render_template :new
      expect(response).to have_http_status(200)
    end
  end
  
  describe 'POST #create' do
    context 'with valid params' do
      before :each do
        post :create, params: { user: {
          username: 'good_user',
          password: 'good_password'
          }}
      end
      it 'should redirect to goals index' do
        expect(response.status).to eq(302)
        expect(response).to redirect_to(goals_url)
      end
      it 'should save the user to the db' do
        expect(User.last.username).to eq('good_user')
      end
    end
  end
  
    context 'with invalid params' do
      before :each do
        post :create, params: { user: {
          username: 'bad_user',
          password: 'bad'
        }}
      end
      it 'should populate flash[:errors]' do
        # expect(flash[:errors].first).to include('#########')
        expect(flash[:errors]).to_not be_nil
      end
      it 'should render new user template' do
        expect(response).to render_template :new
      end
    end
    
  end
  