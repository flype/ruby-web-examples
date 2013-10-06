require 'sinatra/base'

module ThingsTodo
  class Application < Sinatra::Base
    include UrlHelpers

    set :root, ThingsTodo.root
    set :views, File.join(root, 'views')
    set :public_dir, File.join(root, 'public')

    get '/' do
      db_todos = ThingsTodo::DB::Todos.all
      todos = db_todos.map { |t| TodoPresenter.new(t) }
      erb :index, :layout => :application_layout, :locals => { :todos => todos }
    end

    post '/todos' do
      ThingsTodo::DB::Todos.add(params[:todo])
      redirect '/'
    end
  end
end
