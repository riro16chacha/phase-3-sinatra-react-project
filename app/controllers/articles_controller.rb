# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController
  get '/articles' do
    articles = Article.all
    articles.to_json
  end

  post '/articles' do
    article = Article.create(
      title: params[:title],
      content: params[:content]
    )
    if article.valid?
      article.to_json
    else
      status 422
      article.errors.to_json
    end
  end

  get '/articles/:id' do
    article = Article.find_by(id: params[:id])
    if article
      article.to_json
    else
      status 404
      { message: "Article with ID #{params[:id]} not found" }.to_json
    end
  end

  put '/articles/:id' do
    article = Article.find_by(id: params[:id])
    if article
      article.update(
        title: params[:title],
        content: params[:content]
      )
      if article.valid?
        article.to_json
      else
        status 422
        article.errors.to_json
      end
    else
      status 404
      { message: "Article with ID #{params[:id]} not found" }.to_json
    end
  end

  delete '/articles/:id' do
    article = Article.find_by(id: params[:id])
    if article
      article.destroy
      { message: "Article with ID #{params[:id]} has been deleted" }.to_json
    else
      status 404
      { message: "Article with ID #{params[:id]} not found" }.to_json
    end
  end
end

