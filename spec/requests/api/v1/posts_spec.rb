require 'rails_helper'

RSpec.describe "Api::V1::Posts", type: :request do
  describe "GET /index" do
    it 'responds with 200' do
      get api_v1_posts_path
      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema("posts")
    end
  end

  describe "GET /1" do
    let(:post) { create(:post) }

    it 'responds with 200' do
      get api_v1_post_path(post, format: :json)
      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema("post")
    end
  end
end
