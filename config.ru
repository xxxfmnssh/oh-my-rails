require 'pry'

class Application
  def call(env)

    request(env['REQUEST_METHOD'], env['PATH_INFO'], env['REQUEST_PARAMS'])
  end

  def request(method, path, params)
    if path == '/signup'
      if method == 'GET' && 'REQUEST_PARAMS'
        signup = File.open('signup.html').read 
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

  def get(path, method, params)
      [200, { 'Content-Type' => 'text/html' }, ["#{path}, #{method},
      parameters: #{email=qwerty@gmail.com}, #{password=qwerty1}" ]
  end

  def post(path, method)
    [201, { 'Content-Type' => 'text/html' }, ["#{path}, #{method}"]]
  end

  def request_path(_path)
    [404, { 'Content-Type' => 'text/html' }, ['Hey, I dont know what you mean']]
  end
end

run Application.new
