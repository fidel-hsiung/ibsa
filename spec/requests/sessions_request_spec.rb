require 'rails_helper'

RSpec.describe 'Sessions', type: :request do

  before(:all) do
    @user = create(:user, password: 'test1234')
  end

  describe 'GET /login' do
    it 'should has sucess response and render template' do
      get '/login'
      expect(response).to be_successful
      expect(response).to render_template :new
    end

    it 'should redirect_to root_path if current_user exist' do
      login_as(@user)
      get '/login'
      expect(flash[:notice]).to eq 'You have already login.'
      expect(response).to redirect_to root_path
    end
  end

  describe 'Post /sessions' do
    it 'should change session user_id and redirect_to root if valid email and password' do
      post '/sessions', params: {sessions: {email: @user.email, password: 'test1234'}}
      expect(session[:user_id]).to eq @user.id
      expect(response).to redirect_to goods_path
    end

    it 'should not change session user_id and render new if invalid email and password' do
      post '/sessions', params: {sessions: {email: @user.email, password: '12341234'}}
      expect(session[:user_id]).to be_nil
      expect(flash.now[:alert]).to eq 'Email or password is invalid'
      expect(response).to render_template :new
    end
  end

  describe 'Delete /logout' do
    it 'change session user_id to nil and redirect_to root_path' do
      delete '/logout'
      expect(session[:user_id]).to be_nil
      expect(flash[:notice]).to eq 'User successfully logged out!'
      expect(response).to redirect_to root_path
    end
  end

end
