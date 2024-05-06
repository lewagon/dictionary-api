class Counter
  include Singleton

  def initialize
    @mutex = Mutex.new
    @counters = {
      hits: 0,
      found: 0,
      autocomplete: 0
    }
  end

  def increment(counter)
    with_mutex do
      @counters[counter] += 1
    end
  end

  def read(counter)
    with_mutex do
      @counters[counter]
    end
  end

  private

  def with_mutex
    @mutex.synchronize { yield }
  end
end
