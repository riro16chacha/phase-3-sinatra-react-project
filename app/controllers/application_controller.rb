#app/controllers/application_controller.rb
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end
  post "/register" do
    content_type :json

    # Check if the username or email already exists
    if User.exists?(username: params[:username]) || User.exists?(email: params[:email])
      status 422
      return { error: "Username or email already exists" }.to_json
    end

    # Create a new user with the provided username, email, and password
    user = User.new(username: params[:username], email: params[:email], password: params[:password])
    
    if user.save
      status 201
      { message: "User registered successfully" }.to_json
    else
      status 422
      { error: user.errors.full_messages }.to_json
    end
  end

  post "/login" do
    content_type :json

    # Find the user by username or email
    user = User.find_by(username: params[:username]) || User.find_by(email: params[:username])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      status 200
      { message: "Logged in successfully" }.to_json
    else
      status 401
      { error: "Invalid credentials" }.to_json
    end
  end

  post "/logout" do
    content_type :json
    session.clear
    status 200
    { message: "Logged out successfully" }.to_json
  end

  get "/blog_posts" do
    content_type :json
    BlogPost.all.to_json
  end

  post "/blog_posts" do
    content_type :json
    authenticate_user!

    blog_post = current_user.blog_posts.new(title: params[:title], content: params[:content])

    if blog_post.save
      status 201
      blog_post.to_json
    else
      status 422
      { error: blog_post.errors.full_messages }.to_json
    end
  end

  put "/blog_posts/:id" do
    content_type :json
    authenticate_user!

    blog_post = current_user.blog_posts.find_by(id: params[:id])

    if blog_post
      if blog_post.update(title: params[:title], content: params[:content])
        status 200
        blog_post.to_json
      else
        status 422
        { error: blog_post.errors.full_messages }.to_json
      end
    else
      status 404
      { error: "Blog post not found" }.to_json
    end
  end

  delete "/blog_posts/:id" do
    content_type :json
    authenticate_user!

    blog_post = current_user.blog_posts.find_by(id: params[:id])

    if blog_post
      blog_post.destroy
      status 200
      { message: "Blog post deleted successfully" }.to_json
    else
      status 404
      { error: "Blog post not found" }.to_json
    end
  end

  private

  def authenticate_user!
    if !session[:user_id]
      status 401
      halt({ error: "Unauthorized" }.to_json)
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
