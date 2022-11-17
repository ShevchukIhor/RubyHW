require 'erb'

class TimeToPet
  attr_accessor :request

  def initialize(env)
    @request = Rack::Request.new(env)
  end

  def self.call(env)
    new(env).response.finish
  end

  def response
    case @request.path
    when '/' then Rack::Response.new(render_html('index.html.erb'))
    when '/change'
      Rack::Response.new do |response|
        response.set_cookie('id', @request.params['name'])
        response.redirect('/')
      end
      else Rack::Response.new('Page not found', 404, {})
    end
  end

  def render_html(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def greet_name
    @request.cookies['id'] || 'World'
  end
end
