SINATRA_ROOT = File.dirname(__FILE__)

require 'sprockets'
require './supa_spin'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path('assets/javascripts')
  environment.append_path('assets/stylesheets')
  environment.append_path('assets/templates')

  run(environment)
end

run(SupaSpin)
