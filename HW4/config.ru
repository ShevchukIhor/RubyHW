require 'rack'
require '../HW4/lib/time_to_pet'

use Rack::Reloader, 0
run TimeToPet.new