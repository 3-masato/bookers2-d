class Book < ApplicationRecord
  include Searchable

  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  validates :category, presence: true

  scope :with_details,  -> { includes(:user, :favorites, :book_comments) }

  scope :latest,        -> { order(created_at: :desc) }
  scope :star_count,    -> { order(star: :desc) }

  def favorited_by?(user)
    favorites.any? { |favorite| favorite.user_id == user.id }
  end
end
