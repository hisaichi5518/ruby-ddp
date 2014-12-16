require "ddp/version"
require "ddp/core_ext/kernel"
require "ddp/dumper"

module Ddp
  def self.p(obj)
    deprecated "Ddp.p(...) is deprecated. use `dp(...)`."
    dp obj
  end

  def self.dumper(obj)
    deprecated "Ddp.dumper(...) is deprecated. use `dp(...)`."
    dp obj
  end

  private
  def self.deprecated(text)
    warn text + "this method will remove 0.1.5 and this gem version is #{VERSION}"
  end
end
