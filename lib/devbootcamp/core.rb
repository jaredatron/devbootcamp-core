require "devbootcamp/core/version"

require "active_support"
require "active_record"

module Devbootcamp
  module Core

    def self.gem_root
      @gem_root ||= Pathname File.expand_path('../../..')
    end

    def self.initialize
      ActiveRecord::Tasks::DatabaseTasks.env = "test"
      ActiveRecord::Tasks::DatabaseTasks.db_dir = gem_root + 'db'
      ActiveRecord::Tasks::DatabaseTasks.migrations_paths = gem_root + 'db' + 'migrations'

      ActiveRecord::Base.configurations = {
        "test" => {
          "adapter"  =>  "postgresql",
          "encoding" => "unicode",
          "database" => "devbootcamp_core",
        }
      }
    end
    # Your code goes here...
  end
end
