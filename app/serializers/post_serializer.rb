class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user, :status, :created_at, :updated_at

  def user
    { email: self.object.user.email }
  end
end
