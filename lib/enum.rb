
class Enum

  DEFAULT = Object.new
  ID = Object.new

  def self.new(constants)
    enum_subclass = Class.new(Enum) do

      def self.enum_symbols
        constants(false)
      end

      def self.enum_values
        enum_symbols.map { |symbol| const_get(symbol) }
      end

      def self.enum_constants
        enum_symbols.zip(enum_values)
      end

    end

    constants.each_with_index do |constant, i|
      if constant.is_a? Array
        key, value = *constant
        value = i + 1 if value.equal? DEFAULT
        enum_subclass.const_set(key.to_sym, value)
      else
        enum_subclass.const_set(constant.to_sym, i + 1)
      end
    end

    enum_subclass
  end

end