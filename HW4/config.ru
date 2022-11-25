require 'rack'
require_relative './lib/time_to_pet'

use Rack::Reloader, 0
run TimeToPet.new