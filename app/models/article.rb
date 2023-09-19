class Article < ApplicationRecord
  validates :title, presence: true
  validates :caption, presence: true

  belongs_to :user
end
