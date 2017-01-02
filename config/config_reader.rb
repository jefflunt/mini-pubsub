require 'yaml'
require_relative './config'

module ConfigReader
  def self.load(filename)
    Config.new(YAML.load_file(filename))
  end
end
