require 'sinatra/base'
require 'sinatra/json'
require 'slim'

require './lib/services/spinning_service'

class SupaSpin < Sinatra::Base
  helpers Sinatra::JSON

  set :views,      "#{File.dirname(__FILE__)}/views"

  get '/' do
    slim :index
  end

  post '/create' do
    @spinnings = SpinningService.new(params[:content], params[:max_count].to_i, params[:max_characters].to_i).spin

    json spinnings: @spinnings
  end
end
