class Pet
  # render home page
  def call(env)
    Rack::Response.new( render_html("index.html.erb") )
  end
  # end of render home page

  # create html from template
  def render_html(template)
    path = File.expand_path("../veiws/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
  # end of create html file
end

