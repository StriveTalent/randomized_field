# RandomizedField

RandomizedField is a simple module for ActiveRecord that populates a field with a unique, randomly-generated string. This is useful for generating one-off tokens or creating a non-incrementing unique ID.

Oftentimes we want a randomized unique ID so that we don't reveal information about how large our database is or to create an unguessable (and perhaps temporary) token for things like password resets, etc.

You might use RandomizedField to generate:

- Order numbers, return authorization numbers, etc. for an e-commerce system
- Unique referral IDs or invitation tokens for each user of your site
- Tokens for password reset emails
- Temporary tokens embedded in an email that automatically log users in

## Usage

To use RandomizedFIeld, add this line to your application's Gemfile:

```ruby
gem 'randomized_field'
```

Next, include `RandomizedField` in the models you care about, like so:

```ruby
class Article < ApplicationRecord
  include RandomizedField

  randomized_field :slug, length: 10
end
```

RandomizedField won't do anything unless you also call `randomized_field` with the name of the field you want to populate. You can include `RandomizedField` in `ApplicationRecord` or another shared base class if you want `randomized_field` available in every model.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'randomized_field'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install randomized_field

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/StriveTalent/randomized_field.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
