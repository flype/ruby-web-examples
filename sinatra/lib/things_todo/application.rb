require 'sinatra/base'

module ThingsTodo
  class Application < Sinatra::Base
    include UrlHelpers

    set :root, ThingsTodo.root
    set :views, File.join(root, 'views')
    set :public_dir, File.join(root, 'public')
    set :method_override, true

    get '/' do
      db_todos = ThingsTodo::DB::Todos.all
      todos = db_todos.map { |t| TodoPresenter.new(t) }
      erb :index, :layout => :application_layout, :locals => { :todos => todos }
    end

    post '/todos' do
      ThingsTodo::DB::Todos.add(params[:todo])
      redirect '/'
    end

    put '/todos/:id/done' do
      ThingsTodo::DB::Todos.mark_as_done(params[:id])
      redirect '/'
    end
  end
end
