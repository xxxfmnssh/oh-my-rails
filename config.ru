require 'pry'

class Application
  def call(env)
    request(env['REQUEST_METHOD'], env['PATH_INFO'], Rack::Request.new(env).params)
  end

  def request(method, path, params)
    if path == '/signup'
      if method == 'GET'
        email = params['email']
        password = params['password']
        phrase = "Your email is #{email} and your password is #{password}"
        [200, { 'Content-Type' => 'text/html' }, [phrase]]
      elsif method == 'POST'
        post(path, method)
      end
    elsif path == '/posts' && method == 'GET'
      posts = File.open('posts.html').read
      [200, { 'Content-Type' => 'text/html' }, [posts]]
    else
      request_path(path)
    end
  end

  def post(path, method)
    [201, { 'Content-Type' => 'text/html' }, ["You have requested the path #{path}, using #{method}"]]
  end

  def request_path(_path)
    [404, { 'Content-Type' => 'text/html' }, ['Hey, I dont know what you mean']]
  end
end

run Application.new
