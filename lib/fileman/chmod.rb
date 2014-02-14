
module Fileman

  class Chmod
    Fileman::api do
      def chmod destination, options = {}, &block
        Fileman::Chmod.new(destination, options, &block)
      end
    end

    def initialize destination, options = {}, &block
      @destination = destination
      @permissions = options[:permissions]
      instance_eval &block if block_given?
      process
    end

    def permissions perm
      @permissions = perm
    end

    private
    def process
      if @permissions
        ::FileUtils.chmod @permissions, @destination
      end
    end

    def mode_to_s mode
      mode.is_a?(String) ? mode : "%o" % mode
    end

  end
end
