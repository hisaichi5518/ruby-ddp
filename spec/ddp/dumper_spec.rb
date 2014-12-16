require 'spec_helper'
require 'ddp/dumper'

describe Ddp::Dumper do
  describe ".dump" do
    it "return dumped" do
      result = Ddp::Dumper.dump({test: "test"}, {test: "hoge"}, ["hoge", 100])
      expect(result.class).to eq String
    end
  end
end
