require 'sanitize'

module ToHtml

  attr_accessor :to_body

  def initialize
    @to_body
  end

  def read_rb_file(file_name, bypass_html: true)

    if File.exist?("#{file_name}")
    @to_body = File.read("#{file_name}")
    @to_body = bypass_html ? Sanitize.fragment(@to_body) : @to_body
    else
      p 'File not found'
    end

  end

  def insert_to_html(name = "index")
    File.open("#{name}.html", "w") {|file| file.write(document)}
  end

  private

  def document(bypass_html: true)
    "<!DOCTYPE html>
<html lang=\"en\">
  <head>
    <meta charset=\"UTF-8\">
    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <title></title>
  </head>
  <body>
    <div>#{@to_body}</div>
  </body>
</html>"
  end

end