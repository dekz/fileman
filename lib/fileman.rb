require "fileman/version"

module Fileman
  def self.api &block
    s = Object
    before = s.instance_methods
    s.class_eval &block
    after = s.instance_methods - before
    puts "added API #{after}"
  end
end

require 'fileman/chown'
require 'fileman/chmod'
require 'fileman/file'
require 'fileman/tar'
