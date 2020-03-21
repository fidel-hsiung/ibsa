require 'rails_helper'

RSpec.describe 'Pages', type: :request do

  describe 'GET /' do
    it 'should have success response and render template' do
      get '/'
      expect(response).to be_successful
      expect(response).to render_template 'home'
    end
  end

end
