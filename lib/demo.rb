require_relative 'enum'

Color = Enum.new(
  RED: "Red",
  ORANGE: "Orange",
  YELLOW: "Yellow",
  GREEN: "Green",
  BLUE: "Blue",
  PURPLE: "Purple"
)

Colour = Enum.new %i(
  RED
  ORANGE
  YELLOW
  GREEN
  BLUE
  INDIGO
  VIOLET
)

p Color.ancestors
p Color.enum_symbols
p Color.enum_values
p Color.enum_constants

puts

p Colour.ancestors
p Colour.enum_symbols
p Colour.enum_values
p Colour.enum_constants

puts

puts "Color::PURPLE ==> #{Color::PURPLE}"
puts "Colour::VIOLET ==> #{Colour::VIOLET}"

puts

Color.each_pair { |name, value| puts "#{name} is #{value.inspect}" }

puts

Colour.each_pair { |name, value| puts "#{name} is #{value.inspect}" }