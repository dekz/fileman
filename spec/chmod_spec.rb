require File.expand_path('spec_helper', File.dirname(__FILE__))

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
