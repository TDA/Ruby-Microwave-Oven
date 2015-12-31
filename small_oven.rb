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
      puts "Oven not ON!"
    end
    if @contents == nil
      puts "Nothing in the oven"
    end
    "#{@contents}"
  end
end

oven = SmallOven.new
oven.turn_on

items = ['Pie', 'Pizza', 'Coke', nil]

items.each do |item|
  oven.keep(item)
  puts "Serving #{oven.bake}"
end