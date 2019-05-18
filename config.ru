require 'pry'

class Application
  def call(env)
    request(env['REQUEST_METHOD'], env['PATH_INFO'], Rack::Request.new(env).params)
  end

  def request(method, path, params)
    if method == 'GET' && path == '/signup'
      email = params['email']
      password = params['password']
      phrase = "Your email is #{email} and your password is #{password}"
      [200, { 'Content-Type' => 'text/html' }, [phrase]]
      if path == '/signup'
        signup = File.open('signup.html').read
        [200, { 'Content-Type' => 'text/html' }, [signup]]
      elsif method == 'POST' && path = '/signup'
        email = params['email']
        answer = "Your #{email}"
        [200, { 'Content-Type' => 'text/html' }, [answer]]
    end
    elsif path == '/posts' && method == 'GET'
      posts = File.open('posts.html').read
      [200, { 'Content-Type' => 'text/html' }, [posts]]
    else
      request_path(path)
  end
  end

  def request_path(_path)
    [404, { 'Content-Type' => 'text/html' }, ['Hey, I dont know what you mean']]
  end
end

run Application.new
