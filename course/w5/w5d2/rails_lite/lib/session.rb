require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    @req = req

    if req.cookies['_rails_lite_app'].nil?
      @session = {}
    else
      @session = JSON.parse(req.cookies['_rails_lite_app'])
    end
  end

  def [](key)
    @session[key]
  end

  def []=(key, val)
    @session[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie('_rails_lite_app', path: '/', value: @session.to_json)
  end
end

#
# You have a skeleton helper class, Session, in lib/session.rb, which is passed an instance of Rack::Request on initialization. Inside Session#initialize you should grab the cookie named _rails_lite_app. If the cookie has been set before, you should use JSON to deserialize the value of the cookie and store it in an ivar. If no cookie has been set before this ivar should be set to {}.
#
# Provide methods #[] and #[]= that will modify the session content; in this way the Session is Hash-like. Finally, write a method store_session(response) that will put the session into a cookie and set it using Rack::Response#set_cookie. The first argument to set_cookie is the name of the cookie which should be _rails_lite_app. The second argument is the cookie attributes. You specify the cookie's attributes using a hash. You should make sure to specify the path and value attributes. The path should be / so the cookie will available at every path and the value should be the JSON serialized content of the ivar that contains the session data.
#
