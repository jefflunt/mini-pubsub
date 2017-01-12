class NoneSender
  def initialize(destination)
    # no destination
  end

  def publish(msg)
    nil
  end

  def to_s
    'none'
  end
end
