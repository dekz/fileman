
module Fileman

  class Chown
    Fileman::api do
      def chown destination, options = {}, &block
        Fileman::Chown.new(destination, options, &block)
      end
    end

    def initialize destination, options = {}, &block
      @destination = destination
      @user  = options[:user]
      @group = options[:group]
      instance_eval &block if block_given?
      process
    end

    def user name
      @user = name
    end

    def group name
      @group = name
    end

    private
    def process
      if @user or @group
        ::FileUtils.chown @user, @group, @destination
      end
    end

  end
end
