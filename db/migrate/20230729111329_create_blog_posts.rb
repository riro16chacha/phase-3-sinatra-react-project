#db/migrate/20230729111329_create_blog_posts.rb
class CreateBlogPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :content
      t.belongs_to :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
