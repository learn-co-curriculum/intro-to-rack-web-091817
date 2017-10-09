require 'rack'
require 'shotgun'
require 'pry'


class Application

  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    # /search?name=es
    # respond with 'Hi es'
    # /search?name=jason
    # respond with 'Hi jason'
    # /search?name=<anything else>
    # respond with 'I dont know that person'

    binding.pry

    if req.path == '/'
      resp.write('Welcome')
    elsif req.path == '/about'
      resp.write('This is a web application')
    else
      resp.status = 404
      resp.write('404 resource could not be found')
    end

    # [200, {'Content-Type' =>'text/html'}, ['Live Reloading!!!!!']]

    resp.finish
  end

end

run Application.new
