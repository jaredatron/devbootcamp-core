require 'xmlrpc/rack'
require 'devbootcamp/xmlrpc_server'

module Devbootcamp::RackApplication

  @rack_app = XMLRPC::Rack.new Devbootcamp::XMLRPCServer.new

  def self.call env
    @rack_app.call env
  end

end
