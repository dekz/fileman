
module Fileman

  class File
    Fileman::api do
      def file destination, options = {}, &block
        Fileman::File.new(destination, options, &block)
      end
    end

    def initialize destination, options = {}, &block
      @destination = destination
      instance_eval &block
      process
    end

    def user name
      @user = name
    end

    def group name
      @group = name
    end

    def permissions perm
      @permissions = perm
    end

    def contents c=nil
      if c
        @contents = c
      else
        @contents = AppendedFile.new
        return @contents
      end
    end

    private
    def process
      mode = @contents.is_a?(Fileman::AppendedFile) ? 'a+' : 'w+'
      f = ::File.open @destination, mode do |f|
        f.write @contents if @contents
      end

      post_process
    end

    def post_process
      chown @destination, user: @user, group: @group if @user or @group
      chmod @destination, permissions: @permissions if @permissions
    end

  end
  class AppendedFile < String
  end

end
