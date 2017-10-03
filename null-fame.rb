require 'json'
require 'sinatra'
require "sqlite3"

# Sinatra Config
enable :sessions


###########################
# Routes
###########################
#
# Root
#
get '/' do
  db = SQLite3::Database.new db_path
  rows = db.execute <<-SQL
    SELECT
      name
    FROM
      sqlite_master
    WHERE
      type in ('table')
  SQL
  puts "ROWS: #{rows}"
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

def db_path
  File.join(here, 'Beets', 'musiclibrary.blb')
end

