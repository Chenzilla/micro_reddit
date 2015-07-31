class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts
end
