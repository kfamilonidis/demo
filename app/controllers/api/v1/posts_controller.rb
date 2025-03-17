class Api::V1::PostsController < ApplicationController
  # before_action :authenticate_api

  def index
    @posts = Post.all

    render json: @posts
  end

  def show
    @post = Post.find_by(id: params[:id])

    render json: @post, serializer: PostSerializer
  end

  private

  # def authenticate_api
  #   redirect_to root_url unless false
  # end
end
