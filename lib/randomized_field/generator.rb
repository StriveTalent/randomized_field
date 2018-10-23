module RandomizedField
  # Class to generate a random string with a given length and set of valid
  # characters.
  class Generator
    DEFAULTS = {
      length: 8,
      valid_characters: [*("0".."9"), *("a".."z")]
    }.freeze

    def initialize(options = {}, &block)
      @length = options.fetch(:length, DEFAULTS[:length])
      @valid_characters = options.fetch(:valid_characters, DEFAULTS[:valid_characters])
      @block = block || :itself.to_proc
    end

    def generate
      block.call(Array.new(length) { valid_characters.sample }.join)
    end

    private

    attr_reader :block, :length, :valid_characters
  end
end
