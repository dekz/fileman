require 'rubygems'
require 'rubygems/package'

module Fileman
  class Tar < Fileman::File
    Fileman::api do
      def tar destination, options = {}, &block
        Fileman::Tar.new destination, options, &block
      end
    end

    def initialize destination, options = {}, &block
      @destination = destination
      instance_eval &block
      process
    end


    private
    alias :parent_process :process
    def process
      tarfile = StringIO.new ''

      Gem::Package::TarWriter.new(tarfile) do |tar|
        Dir[::File.join('./lib', '**/*')].each do |file|
          mode = File.stat(file).mode
          relative_file = file.sub /^#{Regexp::escape path}\/?/, ''

          if File.directory?(file)
            tar.mkdir relative_file, mode
          else
            tar.add_file relative_file, mode do |tf|
              File.open(file, "rb") { |f| tf.write f.read }
            end
          end
        end
      end

      tarfile.rewind
      tarfile

      @contents = tarfile
      parent_process
    end

  end
  class AppendedFile < String
  end

end
