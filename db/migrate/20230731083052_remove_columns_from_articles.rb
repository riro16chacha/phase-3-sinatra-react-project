class RemoveColumnsFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :image_url, :string
    remove_column :articles, :category_id, :integer
  end
end
