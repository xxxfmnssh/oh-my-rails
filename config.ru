require 'pry'

class Application
  def call(env)
    request(env['REQUEST_METHOD'], env['PATH_INFO'])
  end

  def request(method, path)
    if method == 'GET'
      get(path)
    if path == '/signup'
      request_path
    end

    if method == 'POST'
      post(path)
    if path == '/signup'
      request_path
    end
     
    else path
      request_path(path)
    end
  end
end

  def get(path)
    [200, { 'Content-Type' => 'text/html' }, ["You have requested the path #{path},using GET"]]
  end

  def post(path)
    [201, { 'Content-Type' => 'text/html' }, ["You have requested the path #{path},using POST"]]
  end

  def request_path(path)
    [404, { 'Content-Type' => 'text/html' },["Hey, I dont know what you mean"]]
  end
end

run Application.new
