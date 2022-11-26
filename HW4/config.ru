require 'rack'
require_relative './lib/main_app'

use Rack::Reloader, 0
run MainApp.new