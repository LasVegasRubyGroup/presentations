#!/usr/bin/ruby

class App
  def call(env)
    response = 200
    content_type = "text/html"

    case env['REQUEST_PATH']
    when "/"
      content = File.open("index.html")
    when "/time"
      sleep 0.5
      content_type = "text/plain"
      content = ["Time is #{Time.now}"]
    when "/jquery.js"
      content_type = "text/javascript"
      content = File.open("jquery.js")
    else
      response = 404
      content = ["File not found!"]
    end

    [
     response,
     {"Content-Type" => content_type},
     content
    ]
  end
end

run App.new

