# RailsAdminEnumConfigurable
[![Gem Version](https://badge.fury.io/rb/rails_admin_enum_configurable.png)](http://badge.fury.io/rb/rails_admin_enum_configurable)

RailsAdminEnumConfigurable is a concern that provides useful methods when use enum in RailsAdmin.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_admin_enum_configurable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_admin_enum_configurable

## Usage

If you want to use an enum in RailsAdmin, according to [RailsAdmin's document](https://github.com/sferik/rails_admin/wiki/Enumeration), you have to prepare a `xxx_enum` method (xxx is attribute name which uses enum). But if you include `RailsAdminEnumConfigurable`, you don't need to do that.

```ruby
class User < ApplicationRecord
  include RailsAdminEnumConfigurable
  
  enum status: { active: 1, supended: 2, deleted: 3 }
end
```

That's all! You can use enum in RailsAdmin. In the above, `User#status_enum` will be created dynamically.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kei500/rails_admin_enum_configurable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RailsAdminEnumConfigurable project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kei500/rails_admin_enum_configurable/blob/master/CODE_OF_CONDUCT.md).
