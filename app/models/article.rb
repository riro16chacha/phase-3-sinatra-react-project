# app/models/article.rb
class Article < ActiveRecord::Base
  # Validations
  validates :title, presence: true
  validates :content, presence: true
end