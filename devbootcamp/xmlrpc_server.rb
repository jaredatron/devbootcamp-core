require "xmlrpc/server"

class Devbootcamp::XMLRPCServer < XMLRPC::BasicServer.new

  def initialize
    super
    set_default_handler do |*args|
      Devbootcamp.process(*args)
    end
  end

end
