require 'rails_helper'

RSpec.describe 'Users', type: :request do

  before do
    @user = create(:user)
    login_as(@user)
  end

  describe 'GET /users' do
    it 'should load resources and render template' do
      get '/users'
      expect(assigns(:users)).to eq [@user]
      expect(response).to be_successful
      expect(response).to render_template :index
    end
  end

  describe 'GET /new' do
    it "should have successful response and render template" do
      get '/users/new'
      expect(response).to be_successful
      expect(response).to render_template :new
    end
  end

  describe 'GET /users/:id/edit' do
    it 'should load requested user and render template' do
      get "/users/#{@user.id}/edit"
      expect(assigns(:user)).to eq @user
      expect(response).to be_successful
      expect(response).to render_template :edit
    end
  end

  describe 'POST /users' do
    it 'should create a new User and redirect_to user_url with valid parameters' do
      expect {
        post '/users', params: { user: FactoryBot.attributes_for(:user) }
      }.to change(User, :count).by(1)
      expect(response).to redirect_to(user_url(User.last))
    end

    it 'should not create a new User and render template with invalid parameters' do
      expect {
        post '/users', params: { user: FactoryBot.attributes_for(:user, first_name: '') }
      }.to_not change(User, :count)
      expect(response).to render_template :new
    end
  end

  describe 'PATCH /users' do
    it 'should update the requested user and redirect with valid parameters' do
      expect{
        patch "/users/#{@user.id}", params: { user: {first_name: 'Test'} }
      }.to change{@user.reload.first_name}.to('Test')
      expect(assigns(:user)).to eq @user
      expect(response).to redirect_to(user_url(@user))
    end
    
    it 'should not update user and render template with invalid parameters' do
      expect{
        patch "/users/#{@user.id}", params: {user: {first_name: 'Test', last_name: ''}}
      }.to_not change{@user.reload.first_name}
      expect(assigns(:user)).to eq @user
      expect(response).to render_template :edit
    end
  end

  describe 'DELETE /users' do
    it 'should destroys the requested user' do
      user = create(:user)
      expect {
        delete "/users/#{user.id}"
      }.to change(User, :count).by(-1)
      expect(assigns(:user)).to eq user
      expect(flash[:notice]).to eq 'User was successfully destroyed.'
      expect(response).to redirect_to(users_url)
    end
  end
end
