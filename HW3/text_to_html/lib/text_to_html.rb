require 'sanitize'

module ToHtml

  attr_accessor :to_body

  def initialize
    @to_body
  end

  def read_file(file_name)

    @to_body = file_name

  end

  def insert_to_html(name = "index", bypass_html: true)
    File.open("#{name}.html", "w") {|file| file.write(document)}
    @to_body = bypass_html ? Sanitize.fragment(@to_body) : @to_body
  end

  private

  def document
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