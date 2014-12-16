require 'spec_helper'
require 'ddp/core_ext/kernel'

describe Kernel do
  it "imported dp" do
    expect(Kernel.method(:dp).name).to eq :dp
  end
end
