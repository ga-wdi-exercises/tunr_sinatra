require 'bundler/setup'
require 'pg'
require 'active_record'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/artist'
require_relative 'models/song'


get '/artists' do
  @artists = Artist.all
  erb :"artists/index"
end

get '/artists/new' do
  erb :"artists/new"
end

post '/artists' do
  @artist = Artist.create(params[:artist])
  redirect "/artists/#{@artist.id}"
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb :"artists/show"
end

get '/songs' do
  @songs = Song.all
  erb :"songs/index"
end

get 'songs/new' do
  erb :"songs/new"
end

get '/songs/:id' do
  @song = Song.find(params[:id])
  erb :"songs/show"
end

# post '/artists' do
#   @artist = Artist.create(name: params[:name], photo_url: params[:photo_url], nationality: params[:nationality])
# end
