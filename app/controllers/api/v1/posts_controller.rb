class Api::V1::PostsController < ApplicationController
  before_action :authenticate_request

  def index
    @posts = Post.all

    render json: @posts
  end

  def show
    @post = Post.find_by(id: params[:id])

    render json: @post, serializer: PostSerializer
  end

  private

  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last

    if token
      decoded_token = JwtService.decode(token)

      if decoded_token
        @current_user = User.find_by(id: decoded_token[:user_id])
      else
        render json: { error: 'Invalid or expired token' }, status: :unauthorized
      end
    else
      render json: { error: 'Token missing' }, status: :unauthorized
    end
  end
end
