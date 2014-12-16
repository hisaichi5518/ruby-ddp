module Ddp
  class Dumper
    def self.dump(*val)
      new(*val).dump
    end

    attr_accessor :objects
    def initialize(*val)
      @objects = val
    end

    def dump
      objects.map do |obj|
        strip <<-EOF
        #{fetch_ancestors_without_included_modules_by(obj).join(" < ")} {
          included_modules:
            #{join_included_modules_for(obj, 12)}
          inspect:
            #{inspect_for(obj)}
          source_location:
            #{fetch_source_location(obj)}
        }
        EOF
      end.join()
    end

    private
    def fetch_ancestors_without_included_modules_by(obj)
      obj.class.ancestors - obj.class.included_modules
    end

    def join_included_modules_for(obj, indent)
      obj.class.included_modules.join($/ + " " * indent)
    end

    def inspect_for(obj)
      obj.inspect
    end

    def fetch_source_location(obj)
      return "There is no source_location." if !obj.respond_to?(:source_location)
      sl = obj.source_location
      if sl.nil?
        return "This is C method."
      end
      sl.inspect
    end

    def strip(text)
      indent = text.scan(/^[ \t]*(?=\S)/).min
      size   = 0
      size   = indent.size if indent
      text.gsub(/^[ \t]{#{size}}/, '')
    end
  end
end
