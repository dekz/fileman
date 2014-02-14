$:.unshift File.expand_path(File.join(File.dirname(__FILE__), '../lib'))

require 'fakefs/safe'
require 'fileman'

RSpec.configure do |config|
  config.before(:each) do
    Etc.stub(:getpwnam) do |name|
      double(name: name, uid: 501)
    end
  end
end
