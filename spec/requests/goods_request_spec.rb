require 'rails_helper'

RSpec.describe 'Goods', type: :request do

  before do
    @user = create(:user)
    login_as(@user)
    @good = create(:good)
  end

  describe 'GET /index' do
    it 'should load resources and render template' do
      expect_any_instance_of(GoodSearch).to receive(:records).and_return(Good.all)
      get '/goods'
      expect(assigns(:goods)).to eq [@good]
      expect(response).to be_successful
      expect(response).to render_template :index
    end

    it 'should load resources and render template' do
      expect_any_instance_of(GoodSearch).to receive(:records).and_return(Good.all)
      get '/goods', params: { good_search: {consignment_id: @good.consignment_id} }
      expect(assigns(:goods)).to eq [@good]
      expect(response).to be_successful
      expect(response).to render_template :index
    end

    it 'should redirect to login_path' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      get '/goods'
      expect(response).to redirect_to login_url
    end
  end

  describe 'GET /new' do
    it "should have successful response and render template" do
      get '/goods/new'
      expect(response).to be_successful
      expect(response).to render_template :new
    end
  end

  describe 'GET /goods/:id/edit' do
    it 'should load requested good and render template' do
      get "/goods/#{@good.id}/edit"
      expect(assigns(:good)).to eq @good
      expect(response).to be_successful
      expect(response).to render_template :edit
    end
  end

  describe 'POST /goods' do
    it 'should create a new Good and redirect_to edit_good_url with valid parameters' do
      expect {
        post '/goods', params: { good: FactoryBot.attributes_for(:good) }
      }.to change(Good, :count).by(1)
      expect(flash[:notice]).to eq 'Good was successfully created.'
      expect(response).to redirect_to(edit_good_url(Good.last))
    end

    it 'should not create a new Good and render template with invalid parameters' do
      expect {
        post '/goods', params: { good: FactoryBot.attributes_for(:good, name: '') }
      }.to_not change(Good, :count)
      expect(response).to render_template :new
    end
  end

  describe 'PATCH /goods' do
    it 'should update the requested good and redirect with valid parameters' do
      expect{
        patch "/goods/#{@good.id}", params: { good: {name: 'Food'} }
      }.to change{@good.reload.name}.to('Food')
      expect(assigns(:good)).to eq @good
      expect(flash[:notice]).to eq 'Good was successfully updated.'
      expect(response).to redirect_to(edit_good_url(@good))
    end
    
    it 'should not update good and render template with invalid parameters' do
      expect{
        patch "/goods/#{@good.id}", params: {good: {name: 'Food', source: ''}}
      }.to_not change{@good.reload.name}
      expect(assigns(:good)).to eq @good
      expect(response).to render_template :edit
    end
  end

  describe 'DELETE /goods' do
    it 'should destroys the requested good' do
      good = create(:good)
      expect {
        delete "/goods/#{good.id}"
      }.to change(Good, :count).by(-1)
      expect(assigns(:good)).to eq good
      expect(flash[:notice]).to eq 'Good was successfully destroyed.'
      expect(response).to redirect_to(goods_url)
    end
  end

  describe 'GET /goods/bulk_new' do
    it "should have successful response and render template" do
      get '/goods/bulk_new'
      expect(response).to be_successful
      expect(response).to render_template :bulk_new
    end
  end

  describe 'Post /goods/bulk_create' do
    it "should call GoodsBulkUpload and render template" do
      expect(GoodsBulkUpload).to receive(:new).with(csv: 'test.csv').and_return(double({build: {result: false, total_count: 'N/A', success_count: 0, failed_count: 0, failed_entries: []}}))
      post '/goods/bulk_create', params: {goods_csv: 'test.csv'}, headers: {"ACCEPT" => "application/js"}
      expect(assigns(:response)).to eq ({result: false, total_count: 'N/A', success_count: 0, failed_count: 0, failed_entries: []})
      expect(response).to be_successful
      expect(response).to render_template :bulk_create
    end

    it "should not call GoodsBulkUpload and render template" do
      expect(GoodsBulkUpload).not_to receive(:new)
      post '/goods/bulk_create', headers: {"ACCEPT" => "application/js"}
      expect(assigns(:response)).to eq ({})
      expect(response).to be_successful
      expect(response).to render_template :bulk_create
    end
  end
end
