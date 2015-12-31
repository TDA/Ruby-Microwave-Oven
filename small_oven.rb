# exception classes, can inherit from Exception,
# but practice is StandardError
class OvenOffError < StandardError

end

class OvenEmptyError < StandardError

end

class SmallOven
  attr_accessor :contents, :state

  def turn_on
    @state = 'on'
    puts "Turning on"
  end

  def turn_off
    @state = 'off'
    puts "Turning off"
  end

  def keep(item)
    @contents = item
  end

  def bake
    unless @state == 'on'
      # raise is the equivalent of throw, classType and message
      raise OvenOffError, "Oven not ON!"
    end
    if @contents.nil?
      raise OvenEmptyError, "Nothing in the oven"
    end
    "#{@contents}"
  end
end

oven = SmallOven.new
oven.turn_on

items = ['Pie', 'Pizza', 'Coke', nil]

oven.turn_off
# begin - rescue is like try - catch
items.each do |item|
  begin
    oven.keep(item)
    puts "Serving #{oven.bake}"
    # capture the exception thrown
  rescue OvenOffError => error
    puts "Error : #{error.message}"
    #try to turn it on
    oven.turn_on
    # executes the same code again :O have never heard of
    # this in other langs iv written code in
    puts "Retrying, after turning on"
    retry
  rescue OvenEmptyError => error
    puts "Error : #{error.message}"
  # ensure is just like finally, so place after
  # all rescues, and before the end section
  ensure
    puts "Ensuring that oven is turned off after everything"
    oven.turn_off
  end

end