module Devbootcamp

  @operations = {}

  def self.root
    @root ||= Pathname.new File.expand_path('..', __FILE__)
  end

  def self.env
    @env ||= ActiveSupport::StringInquirer.new(ENV['RACK_ENV'])
  end

  def self.operations
    @operations
  end

  def self.operation name, &block
    @operations[name] = block
  end

  def self.call method, *args
    if operations.keys.exclude? method
      raise ArgumentError, "unknown method #{method.inspect}"
    end
    operations[method].call(*args)
  end

end

Dir[Devbootcamp.root.join('operations/**/*.rb')].each do |operation|
  require operation
end
