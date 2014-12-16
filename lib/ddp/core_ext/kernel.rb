require "ddp/dumper"

module Kernel
  def dp(*val)
    puts Ddp::Dumper.dump(*val)
  end
end
