module Api
  module V1
    class PostsController < BaseController
      def index
        @posts = Post.all

        render json: @posts
      end

      def show
        @post = Post.find_by(id: params[:id])

        render json: @post, serializer: PostSerializer
      end
    end
  end
end
