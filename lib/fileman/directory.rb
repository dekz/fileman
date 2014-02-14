
module Fileman

  class Directory < File
    Fileman::api do
      def directory destination, options = {}, &block
        Fileman::Directory.new(destination, options, &block)
      end
    end

    def initialize destination, options = {}, &block
      @destination = destination
      instance_eval &block
      process
    end

    private
    def process
      post_process
    end

  end

end
