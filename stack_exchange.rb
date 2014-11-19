require 'httparty'

class StackExchange
  # Don't forget to include the gem(s)!
  include HTTParty      

  # This is a convenience method for
  # HTTParty::ClassMethods.base_uri
  base_uri 'api.stackexchange.com'

  # Provide the initial setup information for the HTTP wrapper
  # In this case, we're building an options object that contains
  # the query string parameters we'll need to submit
  def initialize(service, page)
    @options = { :query => { :site => service, :page => page } }
  end

  # Actually run the request using their `get` convenience method
  def questions
    self.class.get("/2.2/questions", @options)
  end

  def users
    self.class.get("/2.2/users", @options)
  end
end

# This creates a link to `api.stackexchange.com/?site=stackoverflow&page=1`
# stack_exchange = StackExchange.new("stackoverflow", 1)
# puts stack_exchange.questions
# puts stack_exchange.users
