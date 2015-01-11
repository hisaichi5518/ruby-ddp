# Ddp

Too Simple Data Printer.

[![Build Status](https://travis-ci.org/hisaichi5518/ruby-ddp.svg?branch=master)](https://travis-ci.org/hisaichi5518/ruby-ddp)

## Usage

Write ruby script:

```ruby
require "ddp"

class TestModule
  def piyo
    # ...
  end
end

dp %w[100 101 102]
dp test: 1000
dp TestModule.method(:instance_method)
dp TestModule.instance_method(:piyo)
```

Run ruby script:

```shell
 $ ruby -Ilib test.rb
Array < Object < BasicObject {
  included_modules:
    Enumerable
    Kernel
  inspect:
    ["100", "101", "102"]
  source_location:
    There is no source_location.
}
Hash < Object < BasicObject {
  included_modules:
    Enumerable
    Kernel
  inspect:
    {:test=>1000}
  source_location:
    There is no source_location.
}
Method < Object < BasicObject {
  included_modules:
    Kernel
  inspect:
    #<Method: Class(Module)#instance_method>
  source_location:
    This is C method.
}
UnboundMethod < Object < BasicObject {
  included_modules:
    Kernel
  inspect:
    #<UnboundMethod: TestModule#piyo>
  source_location:
    ["test.rb", 4]
}
```

## Contributing

1. Fork it ( https://github.com/hisaichi5518/ddp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
