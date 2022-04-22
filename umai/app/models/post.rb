class Post < ApplicationRecord
  belongs_to :user
  has_many :ratings
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
end
