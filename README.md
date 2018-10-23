# RandomizedField

RandomizedField is a simple module for ActiveRecord that populates a field with a unique, randomly-generated string. This is useful for generating one-off tokens or creating a non-incrementing unique ID.

Oftentimes we want a randomized unique ID so that we don't reveal information about how large our database is or to create an unguessable (and perhaps temporary) token for things like password resets, etc.

You might use RandomizedField to generate:

- Order numbers, return authorization numbers, etc. for an e-commerce system
- Unique referral IDs or invitation tokens for each user of your site
- Tokens for password reset emails
- Temporary tokens embedded in an email that automatically log users in

## Installation and Usage

1. Add the `randomized_field` gem to your application's Gemfile:

   ```ruby
   gem 'randomized_field'
   ```
2. Run `bundle` to install the gem

   ```console
   $ bundle
   ```

   Or install it directly with the `gem` command:

   ```console
   $ gem install randomized_field
   ```

3. Include `RandomizedField` in the models you care about (or in a shared base class like `ApplicationRecord` if you want it available to every model):

   ```ruby
   class Article < ApplicationRecord
     include RandomizedField

     randomized_field :slug, length: 10
   end
   ```

**Note**: RandomizedField won't do anything unless you also call `randomized_field` with the name of the field you want to populate.

## Features

Including `RandomizedField` in a model will define a class-level `randomized_field` method.  The only required argument is the name of the field to populate, but there are a few optional arguments.  You can supply one or more of them.

```ruby
class Article < ApplicationRecord
  # Control the length of the generated string.
  # Default is 8.
  randomized_field :slug, length: 10
end

class Article < ApplicationRecord
  # Control the characters used to generate the string.
  # Default is ('0'..'9') + ('a'..'z').
  randomized_field :slug, valid_characters: %w[a b c]
end

class Article < ApplicationRecord
  # Pass in a block that is passed the randomly generated string, but is called
  # before setting the vaue. This allows you to transform the value, e.g.,
  # adding a prefix, suffix, etc.
  # Default is a no-op (don't transform the value)
  randomized_field :slug do |slug_value|
    "prefix_" + slug_value + "_suffix
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/StriveTalent/randomized_field.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).  See the `LICENSE.txt` file.
