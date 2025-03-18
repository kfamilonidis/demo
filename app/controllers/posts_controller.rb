class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:public, :list, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]
  before_action :check_owner_and_status, only: [:show]

  def public
    @posts = Post.includes(:user, :sections).published.page(params[:page])
    render :index
  end

  def index

  end

  def by_week
    @presenter = WeeksPresenter.new(date: params[:date], posts: Post.published)
  end

  def list
    @posts = current_user.posts.includes(:user, :sections).page(params[:page]) if current_user
    @posts ||= Post.includes(:user, :sections).published
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: 'Post was successfully destroyed.'
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.expect(post: [:title, :content, :status, sections_attributes: [ [:id, :content, :type] ] ])
  end

  def check_owner
    if current_user != @post.user
      redirect_to root_path, notice: 'You do not have permission to edit this post'
    end
  end

  def check_owner_and_status
    if @post.user != current_user && !@post.published?
      redirect_to root_path, notice: "You're not allowed"
    end
  end
end
