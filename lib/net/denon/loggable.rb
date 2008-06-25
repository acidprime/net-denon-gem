module Net; module Denon

  # A simple module to make logging easier to deal with. It assumes that the
  # logger instance (if not nil) quacks like a Logger object (in Ruby's
  # standard library). Borrowed with gratitude from Net::SSH.
  #
  #   class MyClass
  #     include Net::Denon::Loggable
  #   end
  #
  module Loggable
    # The logger instance that will be used to log messages. If nil, nothing
    # will be logged.
    attr_accessor :logger

    # Displays the result of yielding if the log level is Logger::DEBUG or
    # greater.
    def debug
      logger.add(Logger::DEBUG, nil, facility) { yield } if logger
    end

    # Displays the result of yielding if the log level is Logger::INFO or
    # greater.
    def info
      logger.add(Logger::INFO, nil, facility) { yield } if logger
    end

    # Displays the result of yielding if the log level is Logger::WARN or
    # greater. (Called lwarn to avoid shadowing with Kernel#warn.)
    def lwarn
      logger.add(Logger::WARN, nil, facility) { yield } if logger
    end

    # Displays the result of yielding if the log level is Logger:ERROR or
    # greater.
    def error
      logger.add(Logger::ERROR, nil, facility) { yield } if logger
    end

    # Displays the result of yielding if the log level is Logger::FATAL or
    # greater.
    def fatal
      logger.add(Logger::FATAL, nil, facility) { yield } if logger
    end

    private

      # Sets the "facility" value, used for reporting where a log message
      # originates. It defaults to the name of class with the object_id
      # appended.
      def facility
        @facility ||= self.class.name.gsub(/::/, ".").gsub(/([a-z])([A-Z])/, "\\1_\\2").downcase + "[%x]" % object_id
      end
  end
end; end