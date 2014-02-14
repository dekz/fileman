require_relative './spec_helper'

describe Fileman::File do
  before :each do
    FakeFS.activate!
  end
  after :each do
    FakeFS::FileSystem.clear
    FakeFS.deactivate!
  end

  it 'has the file api' do
    file 'abcd' do; end;
  end

  it 'can specify the user name to chown to' do
    file 'abcd' do |f|
      user 'test_user'
    end
    expect(File.exists? 'abcd').to be(true)
  end

  it 'can append to files' do
    expect(FileUtils).to receive(:chown).twice.and_call_original
    file 'abcd' do |f|
      contents '1234'
      user 'test_user'
    end
    file 'abcd' do |f|
      contents << '56789'
      user 'test_user'
    end
    expect(File.exists? 'abcd').to be(true)
    expect(File.read 'abcd').to match('123456789')
  end

  it 'can specify the permissions' do
    file 'abcd' do |f|
      contents 'wukka wukka'
      permissions 0755
      user 'test_user'
    end
    expect(File.exists? 'abcd').to be(true)
  end

  it 'can specify the permissions' do
    t = tar 'abcd' do |f|
      contents 'wukka wukka'
      permissions 0755
      user 'test_user'
    end

    expect(File.exists? 'abcd').to be(true)
  end
end
