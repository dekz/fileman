# Fileman

a DSL for file tasks and file manipulations

## Installation

Add this line to your application's Gemfile:

    gem 'fileman'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fileman

## Usage

```ruby
  file '/tmp/test' do
    contents 'test file'
    user 'root'
  end
# File is owned by root and contains 'test file'

  file '/tmp/test' do
    contents << 'here'
    user 'ubuntu'
    group 'users'
    permissions 0755
  end
# File is owned by ubuntu and contains 'test file here'

```

## Contributing

1. Fork it ( http://github.com/dekz/fileman/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
