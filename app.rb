require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new'do
    erb :"/bookmarks/new"
  end
  
  post '/bookmarks' do
    url = params['url']
    title = params['title']
    Bookmark.create(url, title)
    redirect '/bookmarks'
  end

  run! if app_file == $0
end