class Api::V1::CommentsController < ApplicationController
  def index
    @comments = Post.find_by(id: params[:post_id]).comments

    render json: { comments: @comments }
  end
end
