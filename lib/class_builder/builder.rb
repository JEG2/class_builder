module ClassBuilder
  class Builder
    def initialize(details)
      @details = details
    end

    attr_reader :details
    private     :details

    def class
      cls = Class.new
      add_fields(cls)
      cls
    end

    private

    def add_fields(cls)
      readers    = details.public_readers    +
                   details.protected_readers +
                   details.private_readers
      writers    = details.public_writers    +
                   details.protected_writers +
                   details.private_writers
      protecteds = details.protected_readers +
                   details.protected_writers.map { |w| "#{w}=" }
      privates   = details.private_readers   +
                   details.private_writers.map { |w| "#{w}=" }

      cls.class_eval do
        attr_reader(*readers)  unless readers.empty?
        attr_writer(*writers)  unless writers.empty?
        protected(*protecteds) unless protecteds.empty?
        private(*privates)     unless privates.empty?
      end
    end
  end
end
