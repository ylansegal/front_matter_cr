# front_matter_cr

[![Build Status](https://travis-ci.org/takaishi/front_matter_cr.svg?branch=master)](https://travis-ci.org/takaishi/front_matter_cr)

Extract to FrontMatter. Now support yaml or toml.

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  front_matter:
    github: takaishi/front_matter
```


## Usage


```crystal
require "front_matter"


file = File.open("/path/to/file")
front_matter, content = FrontMatter.extract(file)
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/takaishi/front_matter_cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [takaishi](https://github.com/takaishi) Ryo TAKAISHI - creator, maintainer
