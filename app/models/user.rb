class User < ApplicationRecord
  has_many :likes
  has_many :liked_posts, through: :likes, source: :posts
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_like?(post)
    Like.find_by(user_id: self.id, post_id: post.id).present?
  end
end
