# app/models/article.rb
class Article < ActiveRecord::Base
    # Associations
    belongs_to :category
  
    # Validations
    validates :title, presence: true
    validates :content, presence: true
    validates :image_url, presence: true
    validates :category_id, presence: true
  end