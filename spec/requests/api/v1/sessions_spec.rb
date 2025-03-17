require 'rails_helper'

RSpec.describe "Api::V1::Sessions", type: :request do
  describe "POST /" do
    let(:user) { create(:user) }

    it 'authenticates a user' do
      post api_v1_sessions_path, params: { password: user.password, email: user.email }
      expect(response_body['token']).to be_present
    end
  end

  describe 'DETELE' do
    xit 'logs out the user'
  end
end
