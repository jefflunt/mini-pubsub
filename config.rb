class Config
  def initialize(config_attr)
    @config_attr = config_attr
  end

  def method_missing(m, *args, &block)
    @config_attr[m.to_s]
  end
end
