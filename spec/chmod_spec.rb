require_relative './spec_helper'

require 'fakefs/safe'
require 'fileman'

describe Fileman::Chmod do
  before :each do
    FakeFS.activate!
  end
  after :each do
    FakeFS::FileSystem.clear
    FakeFS.deactivate!
  end

  it 'has the chmod api' do
    chmod 'abcd' do; end;
  end
end
