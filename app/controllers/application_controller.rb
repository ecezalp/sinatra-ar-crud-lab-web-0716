require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
     @posts = Post.all
    erb :index
  end

  post '/posts' do
    @new_post = Post.create(name: params[:name], content: params[:content])
    redirect '/posts'
  end

   get '/posts/new' do 
    erb :new
  end

  get '/posts/:id' do 
    @single_post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @to_be_edited = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do 
    @single_post = Post.find(params[:id])
    @single_post.name = params[:name]
    @single_post.content = params[:content]
    @single_post.save
    erb :show
  end

  delete '/posts/:id/delete' do
    @deleted_post = Post.find(params[:id])
    @deleted_post.destroy
    erb :delete
  end
  



  

 

end