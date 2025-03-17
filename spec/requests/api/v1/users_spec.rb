require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do

  context 'auhtorized' do
    include_context 'authorized request'

    describe "GET /" do
      it 'returns current user' do
        get api_v1_users_path, headers: headers
        expect(response_body).to be_a Hash
      end
    end
  end
end
