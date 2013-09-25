require 'rubygems'

ENV['RACK_ENV'] ||= 'development'
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)

require 'bundler/setup'
$:.unshift File.expand_path('../app', __FILE__)

Bundler.require :default, ENV['RACK_ENV']

require "xmlrpc/server"
require "xmlrpc/rack"
require 'devbootcamp'

module App

  def self.root
    @root ||= Pathname.new File.expand_path('../..', __FILE__)
  end

  def self.env
    @env ||= ActiveSupport::StringInquirer.new(ENV['RACK_ENV'])
  end

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
