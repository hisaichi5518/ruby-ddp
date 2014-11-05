# Ddp

TOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO SIMPLE Data Printer

## Usage

Write ruby script:

```ruby
require "ddp"

Ddp.p({test: 1000})
Ddp.p(Ddp.method(:dumper))
```

Run ruby script:

```shell
$ ruby -Ilib test.rb
Hash < Object < BasicObject {
  included_modules:
    Enumerable
    Kernel
  inspect:
    {:test=>1000}
}
Method < Object < BasicObject {
  included_modules:
    Kernel
  inspect:
    #<Method: Ddp.dumper>
  source_location: ["/Users/hisaichi5518/projects/ddp/lib/ddp.rb", 8]
}
```

## Contributing

1. Fork it ( https://github.com/hisaichi5518/ddp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
