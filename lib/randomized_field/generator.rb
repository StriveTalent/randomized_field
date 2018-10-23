module RandomizedField
  # Class to generate a random string with a given length and set of valid
  # characters.
  class Generator
    DEFAULTS = {
      length: 8,
      valid_characters: [*("0".."9"), *("a".."z")]
    }.freeze

    attr_reader :callback, :length, :valid_characters
    private :callback, :length, :valid_characters

    def initialize(options = {}, &block)
      @length = options.fetch(:length, DEFAULTS[:length])
      @valid_characters = options.fetch(:valid_characters, DEFAULTS[:valid_characters])
      @callback = block || :itself.to_proc
    end

    def generate
      callback.call(Array.new(length) { valid_characters.sample }.join)
    end
  end
end
