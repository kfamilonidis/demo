class Post < ApplicationRecord
  belongs_to :user
  has_many :sections, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  paginates_per 6

  def sorted_sections
    sections.sort { |a, b| Section::PRIORITY.index(a.type) <=> Section::PRIORITY.index(b.type) }
  end

  validates_presence_of :title, :content

  enum :status, [:draft, :published, :archived]

  accepts_nested_attributes_for :sections, reject_if: -> (attributes) { attributes['content'].blank? }

  def user_email
    user&.email || '(blank)'
  end
end
