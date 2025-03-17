require 'rails_helper'

RSpec.describe "Api::V1::Posts", type: :request do
  describe "GET /index" do
    it 'responds with 200' do
      get api_v1_posts_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /2" do
    let(:post) { create(:post) }
    it 'responds with 200' do
      get api_v1_post_path(post)
      expect(response).to have_http_status(:ok)
    end
  end
end
