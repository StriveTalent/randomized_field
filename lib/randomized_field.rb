require "randomized_field/version"
require "randomized_field/callback"
require "randomized_field/generator"

require "active_support/concern"

module RandomizedField
  extend ActiveSupport::Concern

  class_methods do
    def randomized_field(field_name, **opts, &block)
      before_create RandomizedField::Callback.new(field_name, **opts, &block)
      validates field_name, uniqueness: true
    end
  end
end
