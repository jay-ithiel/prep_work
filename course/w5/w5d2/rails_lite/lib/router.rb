require 'byebug'

# Add a method Route#run(req, res) that (1) instantiates an instance of the controller class and (2) calls invoke_action. Pass an empty hash as the third argument to ControllerBase#initialize for now. We'll replace that with the real route params soon.

class Route
  attr_reader :pattern, :http_method, :controller_class, :action_name

  def initialize(pattern, http_method, controller_class, action_name)
    @pattern = pattern
    @http_method = http_method
    @controller_class = controller_class
    @action_name = action_name
  end

  # checks if pattern matches path and method matches request method
  def matches?(req)
    (req.path =~ /#{pattern}/ && req.request_method =~ /#{http_method}/i)
  end

  # use pattern to pull out route params (save for later?)
  # instantiate controller and call controller action
  def run(req, res)
    # regex = Regexp.new "/#{@controller_class.to_s.underscore}/(?<id>\d})/"
    match_data = @pattern.match(req.path)
    route_params = {}

    match_data.names.each do |key|
      route_params[key] = match_data[key]
    end

    con = @controller_class.new(req, res, route_params)
    con.invoke_action(@action_name)
  end
end

class Router
  attr_reader :routes

  def initialize
    @routes = []
  end

  # simply adds a new route to the list of routes
  def add_route(pattern, method, controller_class, action_name)
    @routes << [pattern, method, controller_class, action_name]
  end

  # evaluate the proc in the context of the instance
  # for syntactic sugar :)
  def draw(&prc)
    self.instance_eval(&prc)
  end

  # make each of these methods that
  # when called add route
  [:get, :post, :put, :delete].each do |http_method|
    define_method "#{http_method}" do |pattern, controller_class, action_name|
      add_route(pattern, http_method, controller_class, action_name)
    end
  end

  # should return the route that matches this request
  def match(req)
    routes.each do |route|
      pattern = route.shift
      method = route.shift
      controller_class = route.shift
      action_name = route.shift

      route = Route.new(pattern, method, controller_class, action_name)

      return route if route.matches?(req)
    end
    nil
  end

  # either throw 404 or call run on a matched route
  def run(req, res)
    route = match(req)
    if route
      route.run(req, res)
    else
      res.status = 404
    end
  end
end


# Add a method Router#run(req, res) that calls #run on the first matching route. If none is found, return a 404 error by setting the response status. It's also nice to add a message body so the user knows what went wrong.
