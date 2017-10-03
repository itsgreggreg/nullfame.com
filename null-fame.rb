require 'sinatra'
require 'json'
require 'json'

# Sinatra Config
enable :sessions

###########################
# Routes
###########################
#
# Root
#
get '/' do
  erb :index
end

get '/tracks/:filename' do
  track = track_path(params["filename"])
  puts "path: #{track}"
  send_file(track)
end


def here
  File.expand_path '..', __FILE__
end

def track_path(track_name)
  File.join(here, 'music', track_name)
end

