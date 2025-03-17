require 'rails_helper'

RSpec.describe "Api::V1::Posts", type: :request do

  context 'unauthorized' do
    describe "GET /" do
      let!(:post) { create(:post) }

      it 'responds with 200' do
        get api_v1_posts_path
        expect(response).not_to have_http_status(:ok)
        expect(response_body['error']).not_to be_empty
      end
    end
  end

  context 'authorized' do
    include_context 'authorized request'

    describe "GET /" do
      let!(:post) { create(:post) }

      it 'responds with 200' do
        get api_v1_posts_path, headers: headers
        expect(response).to have_http_status(:ok)
        expect(response).to match_response_schema("posts")
      end
    end

    describe "GET /1" do
      let(:post) { create(:post) }

      it 'responds with 200' do
        get api_v1_post_path(post, format: :json), headers: headers
        expect(response).to have_http_status(:ok)
        expect(response_body['title']).to eq(post.title)
        expect(response).to match_response_schema("post")
      end
    end

    describe "GET comments /1/comments" do
      let(:post) { create(:post, :with_comments) }

      it 'responds with 200' do
        get api_v1_post_comments_path(post, format: :json), headers: headers
        expect(response).to have_http_status(:ok)
        expect(response_body['comments']).to be_present
      end
    end

    describe 'DELETE comments' do
      it 'deletes comments' do

      end
    end

    describe 'DELETE posts' do
      it 'deletes posts' do

      end
    end

  end
end
