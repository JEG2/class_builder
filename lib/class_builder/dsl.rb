module ClassBuilder
  class DSL
    def initialize(*shortcuts, &builder)
      @public_readers    = [ ]
      @protected_readers = [ ]
      @private_readers   = [ ]
      @public_writers    = [ ]
      @protected_writers = [ ]
      @private_writers   = [ ]

      build(builder)
    end

    def public_readers(*names)
      @public_readers.concat(names) unless names.empty?
      @public_readers
    end
    alias_method :public_reader, :public_readers

    def protected_readers(*names)
      @protected_readers.concat(names) unless names.empty?
      @protected_readers
    end
    alias_method :protected_reader, :protected_readers

    def private_readers(*names)
      @private_readers.concat(names) unless names.empty?
      @private_readers
    end
    alias_method :private_reader, :private_readers

    def public_writers(*names)
      @public_writers.concat(names) unless names.empty?
      @public_writers
    end
    alias_method :public_writer, :public_writers

    def protected_writers(*names)
      @protected_writers.concat(names) unless names.empty?
      @protected_writers
    end
    alias_method :protected_writer, :protected_writers

    def private_writers(*names)
      @private_writers.concat(names) unless names.empty?
      @private_writers
    end
    alias_method :private_writer, :private_writers

    private

    def build(builder)
      return unless builder

      if builder.arity == 1
        builder.call(self)
      else
        
      end
    end
  end
end
