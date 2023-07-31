#db/migrate/20230729121048_create_articles.rb
class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :image_url
      t.integer :category_id

      t.timestamps
    end

  end
end
