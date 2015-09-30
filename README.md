# Saddler::Reporter::Support

[![Gem version][gem-image]][gem-url] [![Travis-CI Status][travis-image]][travis-url] [![yard docs][docs-image]][docs-url]

> Interface for saddler-reporter. And utilities for saddler-reporter.


## API

Interface for saddler-reporter.

### #initialize(output)

#### output

Type: `#puts`

output interface (defaults to: $stdout)


### #report(messages, options) -> void

#### messages

Type: `String`

reporting message. checkstyle format.

#### options

Type: `Hash`

options from saddler cli.


And more *[details][docs-url]*.


## Changelog

[changelog.md](./changelog.md).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'saddler-reporter-support'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install saddler-reporter-support


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

1. Fork it ( https://github.com/packsaddle/ruby-saddler-reporter-support/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## License

© [sanemat](http://sane.jp)

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[travis-url]: https://travis-ci.org/packsaddle/ruby-saddler-reporter-support
[travis-image]: https://img.shields.io/travis/packsaddle/ruby-saddler-reporter-support/master.svg?style=flat-square&label=build%20%28linux%29
[gem-url]: https://rubygems.org/gems/saddler-reporter-support
[gem-image]: http://img.shields.io/gem/v/saddler-reporter-support.svg?style=flat-square
[docs-url]: http://www.rubydoc.info/gems/saddler-reporter-support
[docs-image]: https://img.shields.io/badge/yard-docs-blue.svg?style=flat-square
