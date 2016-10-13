require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'

# Now in your ControllerBase#initialize method make sure you merge in the route params with the query params and body params hash that Rack::Request.params has parsed and packaged up for you by merging the req.params hash with the route_params

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res, params={})
    @res = res
    @req = req
    @params = params.merge(req.params)
    @already_built_response = false
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "double render" if already_built_response?
    @res['Location'] = url
    @res.status = 302
    @already_built_response = true
    session.store_session(@res)
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "double render" if already_built_response?
    @already_built_response = true
    @res['Content-Type'] = content_type
    @res.write(content)
    @res.finish
    session.store_session(@res)
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    controller_name = ActiveSupport::Inflector.underscore(self.class.to_s)
    template_path = "views/#{controller_name}/#{template_name}.html.erb"

    read_file = File.read(template_path)
    content = ERB.new(read_file).result(binding)

    render_content(content, 'text/html')
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    if self.already_built_response?
      render(name)
    else
      self.send(name)
    end
  end
end

# Add a method ControllerBase#invoke_action(action_name)
# use send to call the appropriate action (like new or show)
# check to see if a template was rendered; if not call render in invoke_action.
