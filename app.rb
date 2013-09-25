require 'rubygems'

ENV['RACK_ENV'] ||= 'development'
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)

require 'bundler/setup'

Bundler.require :default, ENV['RACK_ENV']

require "xmlrpc/server"
require "xmlrpc/rack"
require File.expand_path('../devbootcamp', __FILE__)

module App

  def self.call env
    xmlrpc_rack.call(env)
  end

  def self.xmlrpc_server
    return @xmlrpc_server if defined? @xmlrpc_server
    @xmlrpc_server = XMLRPC::BasicServer.new
    @xmlrpc_server.set_default_handler do |method, *args|
      Devbootcamp.call(method, *args)
    end
    @xmlrpc_server
  end

  def self.xmlrpc_rack
    @xmlrpc_rack ||= XMLRPC::Rack.new xmlrpc_server
  end

end
