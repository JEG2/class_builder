require_relative "class_builder/version"
require_relative "class_builder/dsl"
require_relative "class_builder/builder"

module ClassBuilder
  def self.new(*shortcuts, &builder)
    details = DSL.new(*shortcuts, &builder)
    Builder.new(details).class
  end
end
