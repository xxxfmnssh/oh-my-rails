require 'pp'

class Application
  def call(env)
    req = Rack::Request.new(env)
    pp env
    case env['REQUEST_PATH']
    when /signup/
    	filename = req.path_info.gsub('/', '')
    	view = File.open("#{filename}.html").read   	 	
      [200, { 'Content-Type' => 'text/html' }, [view]]
    else
      [200, { 'Content-Type' => 'text/html' }, ['<html><body><h1>Hello World</h1></body></html>']]
    end
  end
end

run Application.new

