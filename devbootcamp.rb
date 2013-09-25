require 'rubygems'

ENV['RACK_ENV'] ||= 'development'
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)

require 'bundler/setup'
$:.unshift File.expand_path('../devbootcamp', __FILE__)

Bundler.require :default, ENV['RACK_ENV']

module Devbootcamp

  autoload :RackApplication

  def self.root
    @root ||= Pathname.new File.expand_path('..', __FILE__)
  end

  def self.env
    @env ||= ActiveSupport::StringInquirer.new(ENV['RACK_ENV'])
  end

  def self.process method, *args
    [method, args]
  end

end
