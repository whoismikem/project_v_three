require 'rest-client'
class Client

  def session
    @session ||= Session.new
  end

  def execute_connection
    @response = RestClient::Request.execute(method: session.method,
                                            url: session.url,
                                            timeout: session.connection_timeout)
  end

end

class Session
  attr_accessor :url, :header, :method, :connection_timeout

  def initialize
    @header = {}
    @method = :get
    @url = 'https://www.google.com'
    @connection_timeout = 10
  end

end