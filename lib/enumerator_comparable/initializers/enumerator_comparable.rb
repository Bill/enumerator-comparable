class Enumerator

  # We define the spaceship operator (<=>) below so why not just go ahead
  # and let sequences be comparable?
  include Comparable

  # Stream comparison. Works only for finite sequences i.e. if both
  # sequences are infinite, then this method never returns.
  # If you understand dictionary order for words then you understand
  # how this works. Shorter sequences come before longer sequences.
  # Here's a method that ought to be defined in Enumerator::Lazy
  # but isn't.
  def <=>(other)
    loop do
      a, a_end = try_iter &:next
      b, b_end = other.try_iter &:next
      # shorter stream comes before longer (matching) stream
      result = if a_end
        if b_end
          0 # equal
        else
          -1 # I am shorter
        end
      elsif b_end
        1 # other is shorter
      elsif a < b
        -1
      elsif a > b
        1
      end
      next if result.nil?
      return result
    end
  end

  # Sometimes it is inconvenient to rescue StopIteration exceptions.
  # This method turns that exception into a boolean value and returns
  # it along with the next value in the sequence (if any).
  # Useful for wrapping #peek or #next or any method or block that can
  # raise StopIteration. For example:
  #   val, done = try_iter &:next
  def try_iter(&block)
    x, x_end = nil
    begin
      x = yield self
    rescue StopIteration
      x_end = true
    end
    [x,x_end]
  end

end
