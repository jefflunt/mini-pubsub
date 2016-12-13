# Defines the expected interface for subscriber adapters.
class MockDestinationAdapter
  def initialize(destination:)
    # in this calss we ignore the destination
  end

  def send(msg)
    puts msg
  end
end
