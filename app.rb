require 'sinatra/base'
require './lib/story'

class MyRackApp < Sinatra::Base
  set :root, File.dirname(__FILE__)
  enable :sessions

  before do
    @story = Story.instance
  end
  
  get '/' do
    # session[:story] = Story.create('The fox was sleeping fitfully')
    @story = Story.create('The fox was sleeping fitfully')
    redirect '/pages/0'
  end

  get '/pages/:pageid' do
    # @story = session[:story]
    @pageid = params[:pageid]
    @page = @story.pages[@pageid.to_i]
    erb :page
  end

end
