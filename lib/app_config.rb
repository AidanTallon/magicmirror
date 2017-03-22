# frozen_string_literal: true
# Provides access to config.yml
#
# Usage
# AppConfig.data                  Returns data from config.yml
# AppConfig['some_key']           Returns value of 'some_key' from AppConfig.data
# AppConfig.some.key.or.other     Returns specified data. Is equivalent to AppConfig['some']['key']['or']['other']

require 'singleton'
require 'yaml'

class AppConfig
  include Singleton
  attr_reader :data

  def initialize
    config_yaml = File.join(Dir.pwd, 'config.yml')
    load_yaml_data(config_yaml) if File.exist?(config_yaml)
  end

  def load_yaml_data(file)
    @data = YAML.load(File.open(file))
  end

  # Allow calls like AppConfig['some_key']
  def self.[](key_name_)
    instance.value_for(key_name)
  end

  # Allow calls like AppConfig.some_key
  def self.method_missing(name, *args, &block)
    instance.data[name.to_s].nil? ? super : instance.data[name.to_s]
  end

  # Allow calls like AppConfig.some_key
  def self.respond_to?(name)
    instance.data[name.to_s].nil? ? super : true
  end

  def value_for(key_name)
    raise "There is no key '#{key_name}' for the config '#{@data}' in config.yml" if @data[key_name].nil?
    @data[key_name]
  end

end
