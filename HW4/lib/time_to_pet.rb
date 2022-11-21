require 'erb'
require_relative '../pet'

class TimeToPet
  attr_accessor :pet, :name
  attr_reader :request, :path

  def call(env)
    @request = Rack::Request.new(env)
    @path = request.path
    response.finish
  end

  def response
    case @path
    when '/'
      response_rack('index.html.erb')
      @name = request.params['name']
      @pet = Pet.new(@name)
      #@name.nil? || @name.size.zero? ? rack_redirect : rack_redirect('about.html.erb')
      #render home page
      #get name for pet from form name request
      # if pet name have ho name or have null field name redirect
      # to create pet name
    when '/about'
      response_rack('about.html.erb')
    when '/feed'
      response_rack('feed.html.erb')
    when '/play'
      response_rack('play.html.erb')
    when '/hug'
      response_rack('hug.html.erb')
    when '/sleep'
      response_rack('end_game.html.erb')
    else Rack::Response.new('Page not found', 404, {})
      rack_redirect
    #when could not find page, show error and redirect to root path
    end
  end

  def render_html(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def response_rack(template)
    Rack::Response.new(render_html(template))
  end

  def rack_redirect(path = '/')
    Rack::Response.new { |response| response.redirect(path) }
  end

end
