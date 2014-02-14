require_relative './spec_helper'

describe Fileman::Chown do
  before :each do
    FakeFS.activate!
  end
  after :each do
    FakeFS::FileSystem.clear
    FakeFS.deactivate!
  end

  it 'has the chown api' do
    chown 'abcd' do; end;
  end
end
