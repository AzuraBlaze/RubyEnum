
class Enum

  DEFAULT = Object.new

  def self.new(constants)
    enum_subclass = Class.new(Enum) do
      class << self
        include Enumerable

        def enum_symbols
          constants(false)
        end

        def enum_values
          enum_symbols.map { |symbol| const_get(symbol) }
        end

        def enum_constants
          enum_symbols.zip(enum_values)
        end

        def each
          return "No block given" unless block_given?
  
          enum_values.each { |value| yield(value) }
        end

        def each_pair
          return "No block given" unless block_given?
  
          enum_constants.each { |symbol, value| yield(symbol, value) }
        end
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