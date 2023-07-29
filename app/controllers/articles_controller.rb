class ArticlesController < ApplicationController
    get '/articles' do
      articles = Article.all
      articles.to_json
    end
  
    post '/articles' do
      article = Article.create(
        title: params[:title],
        content: params[:content],
        image_url: params[:image_url],
        category_id: params[:category_id]
      )
      article.to_json
    end
  
    get '/articles/:id' do
      article = Article.find(params[:id])
      article.to_json
    end
  
    put '/articles/:id' do
      article = Article.find(params[:id])
      if article.update(
        title: params[:title],
        content: params[:content],
        image_url: params[:image_url],
        category_id: params[:category_id]
      )
        article.to_json
      else
        status 422
        { message: "Failed to update the article" }.to_json
      end
    end
  
    delete '/articles/:id' do
      article = Article.find(params[:id])
      if article.destroy
        { message: "Article with ID #{params[:id]} has been deleted" }.to_json
      else
        status 422
        { message: "Failed to delete the article" }.to_json
      end
    end
  end
  