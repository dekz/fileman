require File.expand_path(File.join(File.dirname(__FILE__), './spec_helper'))

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
