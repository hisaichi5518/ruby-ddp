require 'spec_helper'
require "pp"

describe Ddp do
  it 'has a version number' do
    expect(Ddp::VERSION).not_to be nil
  end

  describe "#dumper" do
    context "arguments is Hash Object" do
      it 'returns pretty string' do
        result = Ddp.dumper({test: "test"})
        expect(result).to match /Hash < Object < BasicObject {/
        expect(result).to match /included_modules:/
        expect(result).to match /inspect:/
        expect(result).not_to match /source_location:/
      end
    end

    context "arguments is Class Object" do
      it 'returns pretty string' do
        result = Ddp.dumper(self)
        expect(result).to match /Object < BasicObject {/
        expect(result).to match /included_modules:/
        expect(result).to match /inspect:/
        expect(result).not_to match /source_location:/
      end
    end

    context "arguments is Method Object" do
      it 'returns pretty string' do
        result = Ddp.dumper(Ddp.method(:p))
        expect(result).to match /Object < BasicObject {/
        expect(result).to match /included_modules:/
        expect(result).to match /inspect:/
        expect(result).to match /source_location:/
      end
    end

    context "arguments is C method Object" do
      it 'returns pretty string' do
        result = Ddp.dumper(100000.method(:abs))
        expect(result).to match /Object < BasicObject {/
        expect(result).to match /included_modules:/
        expect(result).to match /inspect:/
        expect(result).to match /source_location:/
        expect(result).to match /C method/
      end
    end
  end
end
