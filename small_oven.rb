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
      raise "Oven not ON!"
    end
    if @contents == nil
      raise "Nothing in the oven"
    end
    "#{@contents}"
  end
end

oven = SmallOven.new
oven.turn_on

items = ['Pie', 'Pizza', 'Coke', nil]

# begin - rescue is like try - catch
items.each do |item|
  begin
    oven.keep(item)
    puts "Serving #{oven.bake}"
    oven.turn_off
  rescue
    puts "Rescued"
  end

end