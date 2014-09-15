## Linesman ##

Determine if a value is in-bounds

## Gem Setup ##

```ruby
gem install linesman

# Gemfile
gem 'linesman'
```
## How Do I Use This Thing? ##

There's not really much to it. There is only one method: Linesman.within_bounds?

It takes an option hash and a block.

The options hash must contain at least one of the following:

* :exactly
* :min
* :max

The block should return a value that is comparable to the bounds specified in
the options hash.

The method returns either true or false based on the given criteria.

Examples:

```ruby
Linesman.within_bounds?(exactly: 1) {2 - 1} # => true

Linesman.within_bounds?(min: 1, max: 10) {1} # => true
Linesman.within_bounds?(min: 1) {0} # => false
Linesman.within_bounds?(max: 1) {0} # => true
```

## Formal Documentation ##

The actual library docs can be read
[over on rubydoc](http://rubydoc.info/gems/linesman/frames).

## Contributing ##

Do you use git-flow? I sure do. Please base anything you do off of
[the develop branch](https://github.com/ess/linesman/tree/develop).

1. Fork it.
2. Perform some BDD magic. Seriously. Be testing.
3. Submit a pull request.

## So, Uh, Why? ##

In short, I've been needing this exact functionality all over the place of
late, and it was quick enough to just throw it together.

## License ##

MIT License. Copyright 2013 Ess
