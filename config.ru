require 'pry'
require 'pg'

class Application
  def call(env)
    request(env['REQUEST_METHOD'], env['PATH_INFO'], Rack::Request.new(env).params)
  end

  def request(method, path, params)
    if path == '/signup'
      if method == 'GET'
        signup = File.open('signup.html').read
        [200, { 'Content-Type' => 'text/html' }, [signup]]
      elsif method == 'POST'
        email = params['email']
        password = params['password']
        [200, { 'Content-Type' => 'text/html' }, ["Your send next params: email #{email} password #{password}"]]
      end
    else
      request_path(path)
    end
  end

  def request_path(_path)
    [404, { 'Content-Type' => 'text/html' }, ['Hey, I dont know what you mean']]
  end
end

run Application.new
