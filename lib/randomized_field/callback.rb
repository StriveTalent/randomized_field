module RandomizedField
  class Callback
    attr_reader :field_name, :generator

    def initialize(field_name, **generator_opts, &block)
      @field_name = field_name
      @generator = Generator.new(generator_opts, &block)
    end

    def before_create(record)
      record[field_name] ||= new_field_value(record)
    end

    private

    def new_field_value(record)
      old_record = true

      until old_record.nil?
        new_value = generator.generate
        old_record = record.class.find_by(field_name => new_value)
      end

      record[field_name] = new_value
    end
  end
end
