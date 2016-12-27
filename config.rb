require_relative './errors/unknown_config_option'

class Config
  def initialize(config_attr)
    @config_attr = config_attr
  end

  def method_missing(m, *args, &block)
    return @config_attr[m.to_s] if @config_attr.keys.include?(m.to_s)
    raise MiniPubSub::UnknownConfigOption.new(m)
  end
end
